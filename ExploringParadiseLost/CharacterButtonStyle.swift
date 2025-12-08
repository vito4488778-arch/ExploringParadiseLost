//
//  CharacterButtonStyle.swift
//  ExploringParadiseLost
//
//  Created by 114iosClassStudent04 on 2025/12/9.
//

import SwiftUI

// MARK: - 地獄風格 ButtonStyle
struct HellfireButtonStyle: ButtonStyle {
    var cornerRadius: CGFloat = 14
    var baseGradient: Gradient = Gradient(colors: [
        Color(red: 0.2, green: 0.0, blue: 0.0),
        Color(red: 0.5, green: 0.0, blue: 0.0),
        Color(red: 0.85, green: 0.2, blue: 0.0)
    ])
    var flameHighlight: Color = Color(red: 1.0, green: 0.5, blue: 0.0)
    var ember: Color = Color(red: 1.0, green: 0.3, blue: 0.1)
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline.weight(.bold))
            .foregroundStyle(.white)
            .padding(.vertical, 14)
            .padding(.horizontal, 22)
            .background(
                ZStack {
                    // 熔岩漸層底
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .fill(LinearGradient(
                            gradient: baseGradient,
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                    
                    // 火焰光暈
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .strokeBorder(
                            RadialGradient(
                                colors: [flameHighlight.opacity(0.9), ember.opacity(0.2), .clear],
                                center: .center,
                                startRadius: 2,
                                endRadius: 80
                            ),
                            lineWidth: 2
                        )
                        .blendMode(.screen)
                        .opacity(configuration.isPressed ? 0.9 : 0.6)
                        .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
                    
                    // 細微熔岩紋理（噪點）
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color.black.opacity(0.0),
                                    Color.black.opacity(0.1),
                                    Color.black.opacity(0.15),
                                    Color.black.opacity(0.0)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .blendMode(.overlay)
                        .mask(
                            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        )
                        .opacity(0.6)
                }
            )
            // 內陰影 + 外發光
            .shadow(color: ember.opacity(0.55), radius: configuration.isPressed ? 12 : 18, x: 0, y: configuration.isPressed ? 4 : 10)
            .shadow(color: Color.black.opacity(0.6), radius: configuration.isPressed ? 10 : 16, x: 0, y: configuration.isPressed ? 6 : 12)
            // 按壓動作
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .overlay(
                // 火星粒子（簡化版）
                EmberParticles(isActive: configuration.isPressed)
                    .allowsHitTesting(false)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            )
            .animation(.spring(response: 0.25, dampingFraction: 0.75, blendDuration: 0.1), value: configuration.isPressed)
            .contentShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .accessibilityAddTraits(.isButton)
    }
}

// MARK: - 火星粒子效果（純 SwiftUI）
struct EmberParticles: View {
    var isActive: Bool
    @State private var animate = false
    
    var body: some View {
        ZStack {
            ForEach(0..<10, id: \.self) { i in
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [
                                Color(red: 1.0, green: 0.8, blue: 0.2),
                                Color(red: 1.0, green: 0.3, blue: 0.0)
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(width: CGFloat.random(in: 2...4), height: CGFloat.random(in: 2...4))
                    .opacity(isActive ? 0.9 : 0.0)
                    .offset(x: CGFloat.random(in: -40...40), y: animate ? -50 : 0)
                    .blur(radius: 0.5)
                    .animation(
                        .easeOut(duration: Double.random(in: 0.6...0.9))
                        .repeatCount(isActive ? 1 : 0, autoreverses: false),
                        value: animate
                    )
            }
        }
        .onChange(of: isActive) { _, newValue in
            if newValue {
                animate = false
                DispatchQueue.main.async {
                    animate = true
                }
            }
        }
    }
}

// MARK: - 可直接使用的地獄風格按鈕 View
struct HellfireButton: View {
    var title: String
    var systemImage: String?
    var action: () -> Void
    
    init(_ title: String, systemImage: String? = nil, action: @escaping () -> Void) {
        self.title = title
        self.systemImage = systemImage
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                if let systemImage {
                    Image(systemName: systemImage)
                        .symbolRenderingMode(.hierarchical)
                        .foregroundStyle(.white)
                }
                Text(title)
            }
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(HellfireButtonStyle())
    }
}

// MARK: - 舊檔名保留：提供最簡單預覽
struct CharacterButtonStyle: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("進入深淵") { }
                .buttonStyle(HellfireButtonStyle())
            
            HellfireButton("獻上靈魂", systemImage: "flame.fill") {
                // action
            }
        }
        .padding()
        .background(
            LinearGradient(
                colors: [
                    Color.black,
                    Color(red: 0.1, green: 0.0, blue: 0.0)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        )
    }
}

#Preview {
    CharacterButtonStyle()
}
