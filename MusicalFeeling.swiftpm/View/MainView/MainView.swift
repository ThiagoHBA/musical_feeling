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
                    FirstInteractionView(mainController: mainController)
                case .second:
                    SecondInteractionView(mainController: mainController).transition(.move(edge: .trailing))
                case .third:
                    ThirdInteractionView(mainController: mainController).transition(.move(edge: .trailing))
                case .fourth:
                    FourthInteractionView(mainController: mainController).transition(.move(edge: .trailing))
                case .fifth:
                    FifthInteractionView(mainController: mainController).transition(.move(edge: .trailing))
                case .sexth:
                    SexthInteractionView(mainController: mainController).transition(.move(edge: .trailing))
                }
        }
        .background(.white)
        .animation(.default, value: mainController.currentInteraction)
    }
}
