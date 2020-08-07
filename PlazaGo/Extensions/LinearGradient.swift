//
//  LinearGradient.swift
//  PlazaGo
//
//  Created by Jon Alaniz on 8/6/20.
//

import SwiftUI

extension LinearGradient {
    static let lightBackground = LinearGradient(
        gradient: Gradient(
            colors: [.white, .nuLightGrey]),
            startPoint: .topLeading, endPoint: .bottomTrailing
    )
    
    static let darkBackground = LinearGradient(
        gradient: Gradient(
            colors: [.nuBackgroundGrey, .nuDarkGrey]),
            startPoint: .topLeading, endPoint: .bottomTrailing
    )
}
