//
//  ButtonStyles.swift
//  PlazaGo
//
//  Created by Jon Alaniz on 8/6/20.
//

import SwiftUI

struct SimpleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .background(
                ZStack {
                    Circle()
                        .fill(Color.lightBlue)
                    Circle()
                        .fill(Color.lightBlue)
                        .padding(10)
                        .offset(y: 20)
                        .blur(radius: 20)
                }
            )
    }
}

struct SmallSimpleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(20)
            .background(
                ZStack {
                    Circle()
                        .fill(Color.lightBlue)
                    Circle()
                        .fill(Color.lightBlue)
                        .padding(10)
                        .offset(x: 0, y: 20)
                        .blur(radius: 20)
                }
            )
    }
}
