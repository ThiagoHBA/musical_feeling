//
//  SwiftUIView.swift
//  
//
//  Created by Thiago Henrique on 19/04/22.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var mainController = MainViewController()
    
    var body: some View {
        ZStack {
            switch mainController.currentInteraction {
            case .first:
                FirstInteractionView(mainController: mainController).transition(.opacity)
            case .second:
                SecondInteractionView(mainController: mainController).transition(.opacity)
            case .third:
                ThirdInteractionView(mainController: mainController).transition(.opacity)
            case .fourth:
                FourthInteractionView(mainController: mainController).transition(.opacity)
            case .fifth:
                FifthInteractionView(mainController: mainController).transition(.opacity)
            case .sexth:
                SexthInteractionView(mainController: mainController).transition(.opacity)
            }
        }
        .animation(.default, value: mainController.currentInteraction)
    }
}
