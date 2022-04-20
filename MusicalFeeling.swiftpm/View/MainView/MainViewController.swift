//
//  SwiftUIView.swift
//  
//
//  Created by Thiago Henrique on 20/04/22.
//

import SwiftUI

class MainViewController: ObservableObject {
    @Published var currentInteraction: Interations = .first
    
    func obtainInteractionArray () -> [UserInterationModel] {
        return currentInteraction.interationArray
    }
}
