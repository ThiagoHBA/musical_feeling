import SwiftUI

struct FourthInteractionView: View {
    @StateObject private var fourthInteractionController = MusicPlayerController(
        notes: [MusicalNote(note: Note.C)], nextInteraction: .fifth
    )
    @ObservedObject  var mainController : MainViewController
   
    var body: some View {
        MusicPlayerView(
            actualInteractionController: fourthInteractionController,
            mainController: mainController
        )
    }
}
