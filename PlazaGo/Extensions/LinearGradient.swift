//
//  LinearGradient.swift
//  PlazaGo
//
//  Created by Jon Alaniz on 8/6/20.
//

import SwiftUI

extension LinearGradient {
    static let background = LinearGradient(
        gradient: Gradient(
            colors: [.white, .nuLightGrey]),
            startPoint: .topLeading, endPoint: .bottomTrailing
    )
}
