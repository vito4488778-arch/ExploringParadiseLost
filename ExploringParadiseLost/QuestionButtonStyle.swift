//
//  ButtonStyle.swift
//  ExploringParadiseLost
//
//  Created by 114iosClassStudent04 on 2025/12/4.
//

import SwiftUI

struct HeavenButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 24)
            .padding(.vertical, 14)
            .background(
                ZStack {
                    // Base background
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color.white)
                        .shadow(color: .yellow.opacity(0.6), radius: configuration.isPressed ? 4 : 10, x: 0, y: configuration.isPressed ? 1 : 4)

                    // Decorative glow
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .strokeBorder(Color.yellow, lineWidth: 2)
                        .opacity(configuration.isPressed ? 0.6 : 1.0)
                }
            )
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .foregroundColor(.black)
            .animation(.easeOut(duration: 0.12), value: configuration.isPressed)
    }
}
