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
            .padding()
            .background(
                LinearGradient(
                    colors: [.blue.opacity(0.6), .cyan.opacity(0.4)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .foregroundStyle(.white)
            .cornerRadius(12)
            .shadow(color: .blue.opacity(0.3), radius: 5)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
