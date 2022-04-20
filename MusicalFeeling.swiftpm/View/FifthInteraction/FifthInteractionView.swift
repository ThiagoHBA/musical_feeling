//
//  SwiftUIView.swift
//  
//
//  Created by Thiago Henrique on 20/04/22.
//

import SwiftUI

struct FifthInteractionView: View {
    @StateObject private var fifthInteractionController = MusicPlayerController(
        notes: [MusicalNote(note: Note.E), MusicalNote(note: Note.F)], nextInteraction: .sexth
    )
    @ObservedObject  var mainController : MainViewController
   
    var body: some View {
        MusicPlayerView(
            actualInteractionController: fifthInteractionController,
            mainController: mainController
        )
    }}
