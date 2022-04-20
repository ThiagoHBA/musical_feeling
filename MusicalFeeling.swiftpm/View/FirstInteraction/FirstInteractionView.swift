//
//  SwiftUIView.swift
//  
//
//  Created by Thiago Henrique on 20/04/22.
//

import SwiftUI

struct FirstInteractionView : View {
    @StateObject private var firstInteractionController = MusicPlayerController(
        notes: [MusicalNote(note: Note.G)], nextInteraction: .second
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