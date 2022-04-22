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
            
            
        }
        .background(.white)
        .frame(width: 180.0, height: 50.0)
        .clipShape(Capsule())
        .padding(15)
        .shadow(color: .black, radius: 5, y: 5
        )
        .onAppear {
//            if focus {
//                
//                DispatchQueue.global(qos: .default).async {
//                    for _ in 0...3 {
//                        DispatchQueue.main.async {
//                              font = .largeTitle
//                          }
//                        usleep(1000000)
//                        font = .title
//                      }
//                 }
//                
//            }
            
        }
}

    @ViewBuilder
    func generalButtonLabel(label: String) -> some View {
        Text(label)
            .foregroundColor(disable ? .gray : .black)
            .padding(15)
            .font(font)
    }
}

