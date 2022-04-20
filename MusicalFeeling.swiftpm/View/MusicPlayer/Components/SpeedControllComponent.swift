//
//  SwiftUIView.swift
//  
//
//  Created by Thiago Henrique on 18/04/22.
//

import SwiftUI

struct SpeedControllComponent: View {
    @Binding var musicSpeed : Int
    
    var body: some View {
        HStack(alignment: .center) {
            Button {
                if musicSpeed > 1 {
                    musicSpeed /= 2
                }
            } label: {
                generalButtonLabel(label: "-")
            }
            Spacer()
            Button {} label: {
                generalButtonLabel(label: "\(String(musicSpeed))x")
            }
            Spacer()
            Button {
                if musicSpeed < 8 {
                    musicSpeed *= 2
                }
            } label: {
                generalButtonLabel(label: "+")
            }
            

        }.frame(width: 150, height: 25)
            .padding(15)
            .clipShape(Capsule())
    }
    
    @ViewBuilder
    func generalButtonLabel(label: String) -> some View {
        Text(label)
            .foregroundColor(.black)
            .font(.system(size: 30, weight: .bold))
    }
}

