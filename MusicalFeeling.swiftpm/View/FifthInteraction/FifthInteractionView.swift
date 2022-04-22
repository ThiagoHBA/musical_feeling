import SwiftUI

struct FifthInteractionView: View {
    @StateObject private var fifthInteractionController = MusicPlayerController(
        notes: [MusicalNote(note: Note.C)],
        nextInteraction: .sexth
    )
    @ObservedObject var mainController : MainViewController
   
    var body: some View {
        MusicPlayerView(
            actualInteractionController: fifthInteractionController,
            mainController: mainController
        )
    }}
