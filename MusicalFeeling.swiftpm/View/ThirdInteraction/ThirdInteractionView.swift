//
//  SwiftUIView.swift
//  
//
//  Created by Thiago Henrique on 20/04/22.
//

import SwiftUI

struct ThirdInteractionView: View {
    @StateObject private var thirdInteractionController = MusicPlayerController(
        notes: [MusicalNote(note: Note.E), MusicalNote(note: Note.F)], nextInteraction: .fourth
    )
    @ObservedObject  var mainController : MainViewController
   
    var body: some View {
        MusicPlayerView(
            actualInteractionController: thirdInteractionController,
            mainController: mainController
        )
    }
}

