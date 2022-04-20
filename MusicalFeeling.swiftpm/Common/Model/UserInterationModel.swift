import SwiftUI

struct UserInterationModel {
    let text : String
    let screenPosition : ScreenPosition
    var duration : Int?
    var disableNoteDrag: Bool
    var disablePlayButton: Bool
    var disableSpeedControl : Bool
    
    init(text : String,
         screenPosition: ScreenPosition,
         duration: Int? = nil,
         disablePlayButton: Bool = false,
         disableSpeedControl: Bool = false,
         disableNoteDrag: Bool = true
    ) {
        self.text = text
        self.screenPosition = screenPosition
        self.duration = duration
        self.disablePlayButton = disablePlayButton
        self.disableSpeedControl = disableSpeedControl
        self.disableNoteDrag = disableNoteDrag
    }
}
