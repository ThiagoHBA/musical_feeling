import SwiftUI

struct MusicalNoteComponentView: View {
    var musicalNoteModel : MusicalNote!
    
    init(musicalNoteModel: MusicalNote) {
        self.musicalNoteModel = musicalNoteModel
    }
    
    var body: some View {
            Text(self.musicalNoteModel.note.rawValue)
            .frame(minWidth: 65, alignment: .center)
                .font(.system(size: 35))
                .padding(15)
                .background(self.musicalNoteModel!.color)
                .cornerRadius(45)
                .shadow(color: .black, radius: 5, y: musicalNoteModel.onDrag ? 10 : 5)
                .position(
                    x: self.musicalNoteModel.position.x,
                    y: self.musicalNoteModel.position.y
                )
        
    }
}
