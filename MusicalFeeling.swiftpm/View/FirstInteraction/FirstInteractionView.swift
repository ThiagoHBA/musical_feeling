import SwiftUI

struct FirstInteractionView : View {
    @StateObject private var firstInteractionController = MusicPlayerController(
        notes: [MusicalNote(note: Note.C)], nextInteraction: .second
    )
    @ObservedObject  var mainController : MainViewController
   
    var body: some View {
        MusicPlayerView(
            actualInteractionController: firstInteractionController,
            mainController: mainController
        )
    }
}

// State -> Binding (struct)
// StateObject -> ObservedObject (class)
