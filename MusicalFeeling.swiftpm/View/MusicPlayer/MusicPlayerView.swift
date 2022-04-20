import SwiftUI
import AVFoundation


struct MusicPlayerView: View {
    @ObservedObject private var actualInteractionController : MusicPlayerController
    @ObservedObject private var mainController : MainViewController
    
    public init(actualInteractionController: MusicPlayerController, mainController : MainViewController) {
        self.actualInteractionController = actualInteractionController
        self.mainController = mainController
    }
    
    var body: some View {
        VStack{
            ZStack {
                Image("musicalRectangle")
                    .resizable()
                    .frame(height: actualInteractionController.rectangleFrame.1)
                    .padding(35)
                    .position(actualInteractionController.rectanglePosition)
                
                
                HStack{
                    ForEach($actualInteractionController.notes) {
                        $note in
                        
                        MusicalNoteComponentView(musicalNoteModel: note)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        note.position.x = value.location.x
                                        note.position.y = value.location.y
                                        
                                        note.color = Color.gray
                                        
                                        if actualInteractionController.musicalRectangleContainsItem(itemPosition: note.position) {
                                            note.color = Color.red
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
                        text: interationArray[actualInteractionController.actualInteractionCounter].text,
                        yOffSet: interationArray[actualInteractionController.actualInteractionCounter].screenPosition.screenOffSet
                    )
                }
                
            }
            
            HStack{
                Button {
                    var noteFileNames : [String] = []
                    
                    for musicalNote in actualInteractionController.notesInsideMusicalDiagram {
                        noteFileNames.append(musicalNote.note.rawValue)
                    }
                    
                    if !noteFileNames.isEmpty {
                        actualInteractionController.playMutipleSounds(soundFileNames: noteFileNames, withDelay: actualInteractionController.musicSpeed)
                    }
                    
                    withAnimation(.spring(response: 1)) {
                        if !(actualInteractionController.updateInteration(interactionArray: mainController.obtainInteractionArray())) {
                            mainController.currentInteraction = actualInteractionController.nextInteraction
                        }
                    }
                    
                } label: {
                    Label("Play", systemImage: "play.fill")
                        .foregroundColor(.black)
                    .font(.system(size: 25, weight: .bold))}
                
                Spacer()
                
                SpeedControllComponent(musicSpeed: $actualInteractionController.musicSpeed)
            }.padding(35)
            
        }
    }
}





