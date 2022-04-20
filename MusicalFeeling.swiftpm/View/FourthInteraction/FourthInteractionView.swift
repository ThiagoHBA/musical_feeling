//
//  SwiftUIView.swift
//  
//
//  Created by Thiago Henrique on 20/04/22.
//

import SwiftUI

struct FourthInteractionView: View {
    @StateObject private var fourthInteractionController = MusicPlayerController(
        notes: [MusicalNote(note: Note.E), MusicalNote(note: Note.F)], nextInteraction: .fifth
    )
    @ObservedObject  var mainController : MainViewController
   
    var body: some View {
        MusicPlayerView(
            actualInteractionController: fourthInteractionController,
            mainController: mainController
        )
    }
}
