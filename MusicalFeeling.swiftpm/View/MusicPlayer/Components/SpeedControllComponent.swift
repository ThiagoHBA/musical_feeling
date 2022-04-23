import SwiftUI

struct SpeedControllComponent: View {
    @Binding var musicSpeed : Int
    @State var font = Font.title
    var disable : Bool
    var focus: Bool = true
    
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
            generalButtonLabel(label: "\(String(musicSpeed))x", action: false)
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
            
            
        }
        .background(.white)
        .frame(width: 180.0, height: 50.0)
        .clipShape(Capsule())
        .padding(15)
        .shadow(color: .black, radius: 5, y: 5
        )
}

    @ViewBuilder
    func generalButtonLabel(label: String, action: Bool = true) -> some View {
        Text(label)
            .foregroundColor(disable ? .gray : action ? .blue : .black)
            .padding(15)
            .font(font)
    }
}

