import Foundation
import SwiftUI

struct MusicalNote{
    let id: UUID = UUID()
    var note: Note
    var position: CGPoint = CGPoint(x: 0.0, y: 0.0)
    var onDrag: Bool = false
    var toBePlaying : Bool = false
    var playing : Bool = false
    var color: Color {
        if playing {
            return .red
        }
        else if toBePlaying {
            return .blue
        }
        return .gray
    }

    
    
    static func allNotes () -> [MusicalNote] {
        return [
            MusicalNote(note: Note.A),
            MusicalNote(note: Note.Bb),
            MusicalNote(note: Note.B),
            MusicalNote(note: Note.C),
            MusicalNote(note: Note.Db),
            MusicalNote(note: Note.D),
            MusicalNote(note: Note.Eb),
            MusicalNote(note: Note.E),
            MusicalNote(note: Note.F),
            MusicalNote(note: Note.Gb),
            MusicalNote(note: Note.G),
            MusicalNote(note: Note.Ab)
        ]
    }
}

extension MusicalNote : Identifiable { }
