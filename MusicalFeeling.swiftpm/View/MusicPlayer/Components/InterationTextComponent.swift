//
//  SwiftUIView.swift
//  
//
//  Created by Thiago Henrique on 19/04/22.
//

import SwiftUI

struct InterationText: View {
    var interaction : UserInterationModel
    var hide: Bool = false
    
    var body: some View {
        Text(interaction.text)
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
            .padding(25)
            .background(.gray)
            .cornerRadius(20)
            .offset(y: interaction.screenPosition.screenOffSet)
            .animation(.spring(), value: 1.0)
            .opacity(hide ? 0 : 1)
    }
}

