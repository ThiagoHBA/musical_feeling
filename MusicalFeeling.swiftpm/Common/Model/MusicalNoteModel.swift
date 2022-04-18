import Foundation
import SwiftUI

struct MusicalNote{
    let id: UUID = UUID()
    var note: Note
    var position: CGPoint
    var color: Color
}

extension MusicalNote: Identifiable { }
