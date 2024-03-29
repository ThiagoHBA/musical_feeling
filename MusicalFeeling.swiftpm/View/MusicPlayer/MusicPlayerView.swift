import SwiftUI
import AVFoundation


struct MusicPlayerView: View {
    @ObservedObject var actualInteractionController : MusicPlayerController
    @ObservedObject var mainController : MainViewController
    @State var orientation = UIDevice.current.orientation
    
    let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
        .makeConnectable()
        .autoconnect()
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        let actualInteraction = mainController.currentInteraction.interationArray[actualInteractionController.actualInteractionCounter]
        let interactionArray = mainController.obtainInteractionArray()
        var timeRemaining : Int? = actualInteraction.duration
        
        VStack{
            if orientation.isLandscape {}
            ZStack {
                Image("musicalRectangle")
                    .resizable()
                    .frame(height: actualInteractionController.rectangleFrame.1)
                    .padding(35)
                    .position(actualInteractionController.rectanglePosition)
                
                ScrollView(.horizontal) {
                    HStack{
                        ForEach($actualInteractionController.notes) {
                            $note in
                            MusicalNoteComponentView(musicalNoteModel: note)
                                .gesture(
                                    DragGesture(minimumDistance: 0)
                                        .onChanged { value in
                                            if !actualInteraction.disableNoteDrag {
                                                note.position.x = value.location.x
                                                note.position.y = value.location.y
                                                
                                                note.toBePlaying = false
                                                note.onDrag = true
                                                
                                                if actualInteractionController.musicalRectangleContainsItem(itemPosition: note.position) {
                                                    note.toBePlaying = true
                                                }
                                            }
                                            
                                        }.onEnded { value in
                                            withAnimation(.spring()) {
                                                
                                                if actualInteractionController.musicalRectangleContainsItem(itemPosition: note.position) {
                                                    note.toBePlaying = true
                                                    if !(actualInteractionController.notesInsideMusicalDiagram.contains(where: {$0.note == note.note})) {
                                                        actualInteractionController.notesInsideMusicalDiagram.append(note)
                                                    }
                                                }
                                                else {
                                                    note.toBePlaying = false
                                                    if let index = actualInteractionController.notesInsideMusicalDiagram.firstIndex(where: {$0.note == note.note}) {
                                                        actualInteractionController.notesInsideMusicalDiagram.remove(at: index)
                                                    }
                                                }
                                                
                                                note.onDrag = false
                                            
                                            }
                                        }
                                )
                                .padding([.trailing], 10)
                        }
                    }.padding(75)
                }
                
                if actualInteraction.text != nil {
                    InterationText(
                        interaction: actualInteraction,
                        onTapGesture: {
                            if actualInteraction.disablePlayButton {
                                actualInteractionController.updateInteration(
                                    interactionArray: interactionArray,
                                    mainController: mainController
                                )
                            }
                        }
                    ).animation(.spring(response: 1), value: actualInteractionController.actualInteractionCounter)
                }
                
            }.onReceive((timer)) { time in

                if timeRemaining != nil {
                    if timeRemaining! > 0 {
                        timeRemaining! -= 1
                        return
                    }
                    
                    actualInteractionController.updateInteration(
                        interactionArray: interactionArray,
                        mainController: mainController
                    )
                }

            }
            
            HStack(alignment: .center){
                Button {
                
                    if !actualInteractionController.notesInsideMusicalDiagram.isEmpty {
                        
                        if actualInteraction.generatadeNotes != nil {
                            actualInteractionController.changeDiagramNotes(newNotes: actualInteraction.generatadeNotes!)
                            
                            withAnimation(.spring()){
                                actualInteractionController.notes = actualInteractionController.notesInsideMusicalDiagram
                            }
                            
                        }
                        
                        actualInteractionController.playDigramNotes()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + Double(2/actualInteractionController.musicSpeed)) {
                            actualInteractionController.updateInteration(
                                interactionArray: interactionArray,
                                mainController: mainController
                            )
                        }
                    
                    }
                    
                } label: {
                    
                    Label("Play", systemImage: "play.fill")
                        .foregroundColor(actualInteractionController.notesInsideMusicalDiagram.isEmpty || actualInteraction.disablePlayButton ? .gray : .blue)
                        .font(.title)
                    
                    
                }.disabled(
                    actualInteractionController.notesInsideMusicalDiagram.isEmpty || actualInteraction.disablePlayButton
                )
                
                Spacer()
                
                SpeedControllComponent(
                    musicSpeed: $actualInteractionController.musicSpeed,
                    disable: actualInteraction.disableSpeedControl
                    
                )
                
            }
        
            .padding(35)
        }.onReceive(orientationChanged) { _ in
            self.orientation = UIDevice.current.orientation
        }
    }
}

