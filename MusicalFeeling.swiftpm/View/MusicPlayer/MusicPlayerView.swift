import SwiftUI
import AVFoundation

struct MusicPlayerView: View {
    let controller = MusicPlayerController()
    
    @State private var notesInsideMusicalDiagram : [MusicalNote] = []
    @State private var musicSpeed = 1
    
    @State private var actualInteration = (position: 0, counter: 0)
    
    @State private var notes: [MusicalNote] = [
        MusicalNote (
            note: Note.C,
            position: CGPoint(
                x: UIScreen.main.bounds.size.width * 0.06,
                y: UIScreen.main.bounds.size.height * 0.1
            ),
            color: Color.gray
        ),
        MusicalNote (
            note: Note.D,
            position: CGPoint(
                x: UIScreen.main.bounds.size.width * 0.06,
                y: UIScreen.main.bounds.size.height * 0.1
            ),
            color: Color.gray
        ),
        MusicalNote (
            note: Note.D,
            position: CGPoint(
                x: UIScreen.main.bounds.size.width * 0.06,
                y: UIScreen.main.bounds.size.height * 0.1
            ),
            color: Color.gray
        )
    ]
    
    
    var body: some View {
        VStack{
            ZStack {
                Image("musicalRectangle")
                    .resizable()
                    .frame(height: controller.rectangleFrame.1)
                    .position(controller.rectanglePosition)
                
                HStack {
                    ForEach($notes) { $note in
                        MusicalNoteComponentView(musicalNoteModel: note)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        note.position.x = value.location.x
                                        note.position.y = value.location.y
                                        
                                        note.color = Color.gray
                                        
                                        if controller.musicalRectangleContainsItem(itemPosition: note.position) {
                                            note.color = Color.red
                                        }
                                        
                                    }.onEnded { value in
                                        withAnimation(.spring()) {
                                            if controller.musicalRectangleContainsItem(itemPosition: note.position) {
                                                note.color = Color.blue
                                                if !(self.notesInsideMusicalDiagram.contains(where: {$0.note == note.note})) {
                                                    self.notesInsideMusicalDiagram.append(note)
                                                }
                                            }
                                            else {
                                                if let index = self.notesInsideMusicalDiagram.firstIndex(where: {$0.note == note.note}) {
                                                    self.notesInsideMusicalDiagram.remove(at: index)
                                                }
                                            }
                                        }
                                    }
                            )
                    }
                }
                
                if let interation = Interations.init(rawValue: actualInteration.position) {
                    InterationText(
                        text: interation.interationArray[actualInteration.counter].text,
                        yOffSet: interation.interationArray[actualInteration.counter].screenPosition.screenOffSet
                    )
                }
    
            }
            
            HStack{
                Button {
                    var noteFileNames : [String] = []
                    for musicalNote in self.notesInsideMusicalDiagram {
                        noteFileNames.append(musicalNote.note.rawValue)
                    }
                    if !noteFileNames.isEmpty {
                        controller.playMutipleSounds(soundFileNames: noteFileNames)
                    }
                    
                    withAnimation(.spring(response: 1)) {
                        if actualInteration.position > 0 {
                            if actualInteration.counter < 2 {
                                actualInteration.counter += 1
                            }
                            else {
                                actualInteration.position += 1
                                actualInteration.counter = 0
                            }
                        }
                        else{
                            actualInteration.position += 1
                        }
                    }
                    
                } label: {
                    Label("Play", systemImage: "play.fill")
                        .foregroundColor(.black)
                        .padding(25)
                    .font(.system(size: 25, weight: .bold))}
                Spacer()
                SpeedControllComponent(musicSpeed: $musicSpeed)
            }
            
        }.padding(.all, 25)
    }
}





