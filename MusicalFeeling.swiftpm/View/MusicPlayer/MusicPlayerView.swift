import SwiftUI
import AVFoundation


struct MusicPlayerView: View {
    @ObservedObject var actualInteractionController : MusicPlayerController
    @ObservedObject var mainController : MainViewController
    @State private var timeRemaining : Int?
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack{
            ZStack {
                Image("musicalRectangle")
                    .resizable()
                    .frame(height: actualInteractionController.rectangleFrame.1)
                    .padding(35)
                    .position(actualInteractionController.rectanglePosition)
                
                HStack{
                    let actualInteraction = mainController.currentInteraction.interationArray[actualInteractionController.actualInteractionCounter]
                    
                    ForEach($actualInteractionController.notes) {
                        $note in
                        MusicalNoteComponentView(musicalNoteModel: note)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        
                                        if !actualInteraction.disableNoteDrag {
                                            note.position.x = value.location.x
                                            note.position.y = value.location.y
                                            
                                            note.color = Color.gray
                                            
                                            if actualInteractionController.musicalRectangleContainsItem(itemPosition: note.position) {
                                                note.color = Color.red
                                            }
                                
                                        }
                                    }.onEnded { value in
                                        withAnimation(.spring()) {
                                            if actualInteractionController.musicalRectangleContainsItem(itemPosition: note.position) {
                                                note.color = Color.blue
                                                if !(actualInteractionController.notesInsideMusicalDiagram.contains(where: {$0.note == note.note})) {
                                                    actualInteractionController.notesInsideMusicalDiagram.append(note)
                                                }
                                            }
                                            else {
                                                if let index = actualInteractionController.notesInsideMusicalDiagram.firstIndex(where: {$0.note == note.note}) {
                                                    actualInteractionController.notesInsideMusicalDiagram.remove(at: index)
                                                }
                                            }
                                        }
                                    }
                            ).padding(70)
                    }
                }
                
                if let interationArray = mainController.obtainInteractionArray() {
                    InterationText(
                        interaction: interationArray[actualInteractionController.actualInteractionCounter],
                        hide: false
                    ).animation(.spring(response: 1), value: actualInteractionController.actualInteractionCounter)
                }
                
            }.onReceive((timer)) { time in
                let interactionArray = mainController.obtainInteractionArray()
           
                if timeRemaining != nil {
                    if timeRemaining! > 0 {
                        timeRemaining! -= 1
                        return
                    }
                    
                    if !(actualInteractionController.updateInteration(interactionArray: interactionArray)) {
                        mainController.currentInteraction = actualInteractionController.nextInteraction
                        return
                    }
                    
                    timeRemaining = interactionArray[actualInteractionController.actualInteractionCounter].duration
                }
            }
            
            HStack{
                let interactionArray = mainController.obtainInteractionArray()
                let buttonDisable : Bool = interactionArray[actualInteractionController.actualInteractionCounter].disablePlayButton
                let speedDisable : Bool = interactionArray[actualInteractionController.actualInteractionCounter].disableSpeedControl
                
                Button {
                    if buttonDisable {return}
                    
                    var noteFileNames : [String] = []
                    
                    for musicalNote in actualInteractionController.notesInsideMusicalDiagram {
                        noteFileNames.append(musicalNote.note.rawValue)
                    }
                    
                    if !noteFileNames.isEmpty {
                        actualInteractionController.playMutipleSounds (
                            soundFileNames: noteFileNames,
                            withDelay: actualInteractionController.musicSpeed
                        )
                    }
                    
                    if !(actualInteractionController.updateInteration(interactionArray: interactionArray)) {
                        mainController.currentInteraction = actualInteractionController.nextInteraction
                    }
                    
                    timeRemaining = interactionArray[actualInteractionController.actualInteractionCounter].duration
                    
                } label: {
                    Label("Play", systemImage: "play.fill")
                        .foregroundColor(buttonDisable ? .gray : .black)
                        .font(.system(size: 25, weight: .bold))
                }.disabled(buttonDisable)
                
                Spacer()
                
                SpeedControllComponent(
                    musicSpeed: $actualInteractionController.musicSpeed,
                    disable: speedDisable
                )
                
            }.padding(35)
            
        }
        .onAppear {
            timeRemaining = mainController.currentInteraction.interationArray[actualInteractionController.actualInteractionCounter].duration
        }
    }
}





