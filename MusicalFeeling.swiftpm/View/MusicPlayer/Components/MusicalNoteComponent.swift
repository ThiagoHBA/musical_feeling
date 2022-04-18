import SwiftUI

struct MusicalNoteComponentView: View {
    var musicalNoteModel : MusicalNote!
    
    init(musicalNoteModel: MusicalNote) {
        self.musicalNoteModel = musicalNoteModel
    }
    
    var body: some View {
            Text(self.musicalNoteModel.note.rawValue)
                .font(.system(size: 65))
                .padding()
                .background(self.musicalNoteModel!.color)
                .cornerRadius(25)
                .position(
                    x: self.musicalNoteModel.position.x,
                    y: self.musicalNoteModel.position.y
                )
        
    }
}
