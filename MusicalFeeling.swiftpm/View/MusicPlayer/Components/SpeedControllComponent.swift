import SwiftUI

struct SpeedControllComponent: View {
    @Binding var musicSpeed : Int
    var disable : Bool
    
    var body: some View {
        HStack(alignment: .center) {
            Button {
                if musicSpeed > 1 {
                    musicSpeed /= 2
                }
            } label: {
                generalButtonLabel(label: "-")
            }.disabled(disable)
            
            Spacer()
            
            Button {}
            label: {
                generalButtonLabel(label: "\(String(musicSpeed))x")
            }
            .disabled(disable)
            
            Spacer()
            
            Button {
                if musicSpeed < 8 {
                    musicSpeed *= 2
                }
            } label: {
                generalButtonLabel(label: "+")
            }.disabled(disable)
            

        }.frame(width: 150, height: 25)
            .padding(15)
            .clipShape(Capsule())
    }
    
    @ViewBuilder
    func generalButtonLabel(label: String) -> some View {
        Text(label)
            .foregroundColor(disable ? .gray : .black)
            .font(.system(size: 30, weight: .bold))
    }
}

