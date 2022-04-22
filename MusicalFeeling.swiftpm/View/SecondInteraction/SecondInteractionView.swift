import SwiftUI

struct SecondInteractionView : View {
    @StateObject private var secondInteractionController = MusicPlayerController(
        notes: [MusicalNote(note: Note.C)], nextInteraction: .third
    )
    @ObservedObject  var mainController : MainViewController
    
    var body: some View {
        MusicPlayerView(
            actualInteractionController: secondInteractionController,
            mainController: mainController
        )
    }
}
