import SwiftUI

struct UserInterationModel {
    let text : String?
    let screenPosition : ScreenPosition?
    var duration : Int?
    var disableNoteDrag: Bool
    var disablePlayButton: Bool
    var disableSpeedControl : Bool
    var focusOn : [ItemFocus]?
    var generatadeNotes: [MusicalNote]?
    
    init(text : String? = nil,
         screenPosition: ScreenPosition? = nil,
         duration: Int? = nil,
         disablePlayButton: Bool = false,
         disableSpeedControl: Bool = false,
         disableNoteDrag: Bool = true,
         focusOn: [ItemFocus]? = nil,
         generatadeNotes: [MusicalNote]? = nil
    ) {
        self.text = text
        self.screenPosition = screenPosition
        self.duration = duration
        self.disablePlayButton = disablePlayButton
        self.disableSpeedControl = disableSpeedControl
        self.disableNoteDrag = disableNoteDrag
        self.generatadeNotes = generatadeNotes
        self.focusOn = focusOn
    }
}
