//
//  SwiftUIView.swift
//  
//
//  Created by Thiago Henrique on 19/04/22.
//

import SwiftUI

struct InterationText: View {
    var text : String
    var yOffSet : CGFloat
    
    var body: some View {
        Text(text)
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
            .padding(25)
            .background(.gray)
            .cornerRadius(20)
            .offset(y: yOffSet)
            .animation(.spring(), value: 1.0)
    }
}
