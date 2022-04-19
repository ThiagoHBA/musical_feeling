//
//  SwiftUIView.swift
//  
//
//  Created by Thiago Henrique on 19/04/22.
//

import SwiftUI

enum ScreenPosition {
    case top
    case center
    case bottom
    
    var screenOffSet : CGFloat {
        switch self {
        case.center:
            return UIScreen.main.bounds.height * 0
        case .top:
            return -UIScreen.main.bounds.height * 0.3
        case .bottom:
            return UIScreen.main.bounds.height * 0.3
        }
    }
}
