//
//  SwiftUIView.swift
//  
//
//  Created by Thiago Henrique on 20/04/22.
//

import SwiftUI

struct SecondInteractionView : View {
    @StateObject private var secondInteractionController = MusicPlayerController(
        notes: [MusicalNote(note: Note.D)], nextInteraction: .third
    )
    @ObservedObject  var mainController : MainViewController
    
    var body: some View {
        MusicPlayerView(
            actualInteractionController: secondInteractionController,
            mainController: mainController
        )
    }
}
