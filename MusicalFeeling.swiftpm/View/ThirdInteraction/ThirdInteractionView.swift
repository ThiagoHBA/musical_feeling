import SwiftUI

struct ThirdInteractionView: View {
    @StateObject private var thirdInteractionController = MusicPlayerController(
        notes: [MusicalNote(note: Note.C)], nextInteraction: .fourth,
        musicSpeed: 8
    )
    @ObservedObject  var mainController : MainViewController
   
    var body: some View {
        MusicPlayerView(
            actualInteractionController: thirdInteractionController,
            mainController: mainController
        )
    }
}

