import Foundation
import SwiftUI

struct MusicalNote{
    let id: UUID = UUID()
    var note: Note
    var position: CGPoint = CGPoint(x: 0.0, y: 0.0)
    var color: Color = .gray
}

extension MusicalNote : Identifiable { }
