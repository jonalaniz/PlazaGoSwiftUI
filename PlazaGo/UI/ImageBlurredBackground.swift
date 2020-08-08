//
//  Blurred.swift
//  PlazaGo
//
//  Created by Jon Alaniz on 8/6/20.
//

import SwiftUI

struct Blurred: ViewModifier {
    func body(content: Content) -> some View {
        content
            .offset(y: 30)
            .blur(radius: 20)
            .opacity(0.5)
    }
}
