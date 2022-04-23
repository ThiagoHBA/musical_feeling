import SwiftUI

struct InterationText: View {
    var interaction : UserInterationModel
    var onTapGesture : () -> Void
    
    var body: some View {
        Text(.init(interaction.text!))
            .multilineTextAlignment(.center)
            .padding(30)
            .background(.white)
            .cornerRadius(20)
            .shadow(color: .black, radius: 5, y: 5)
            .offset(y: interaction.screenPosition!.screenOffSet)
            .animation(.spring(), value: 1.0)
            .onTapGesture{
                onTapGesture()
            }
    }
}

