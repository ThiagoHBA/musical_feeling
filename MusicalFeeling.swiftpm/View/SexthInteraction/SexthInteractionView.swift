//
//  SwiftUIView.swift
//  
//
//  Created by Thiago Henrique on 20/04/22.
//

import SwiftUI

struct SexthInteractionView: View {
    @StateObject private var sexthInteractionController = MusicPlayerController(
        notes: [MusicalNote(note: Note.E), MusicalNote(note: Note.F)], nextInteraction: .first
    )
    @ObservedObject  var mainController : MainViewController
   
    var body: some View {
        MusicPlayerView(
            actualInteractionController: sexthInteractionController,
            mainController: mainController
        )
    }
}
