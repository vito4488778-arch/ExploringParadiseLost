//
//  ReadingButtonStyle.swift
//  ExploringParadiseLost
//
//  Created by 114iosClassStudent04 on 2025/12/7.
//

import SwiftUI

struct ReadingButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            // 字型交由外部（ContentView）統一控制，這裡不設置字型
            .padding(.horizontal, 24)
            .padding(.vertical, 14)
            .foregroundColor(.black)
            .background(
                ZStack {
                    // 雙向冷暖主背景：左天堂（冰藍白金），右地獄（熾紅炭黑）
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 0.86, green: 0.92, blue: 1.0), // 冷光藍（左）
                                    Color.white,                                // 白金
                                    Color(red: 0.98, green: 0.82, blue: 0.35), // 淡金過渡
                                    Color(red: 0.95, green: 0.35, blue: 0.25), // 熾紅（右）
                                    Color(red: 0.20, green: 0.06, blue: 0.05)  // 炭黑（右極）
                                ]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        // 輕量陰影，避免視覺外擴過大
                        .shadow(color: .black.opacity(configuration.isPressed ? 0.08 : 0.12),
                                radius: configuration.isPressed ? 3 : 6,
                                x: 0, y: configuration.isPressed ? 1 : 3)
                        .overlay {
                            // “聖光”柔暈：左側淡淡白光
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .fill(
                                    RadialGradient(
                                        colors: [
                                            Color.white.opacity(configuration.isPressed ? 0.12 : 0.2),
                                            Color.white.opacity(0.0)
                                        ],
                                        center: .leading,
                                        startRadius: 6,
                                        endRadius: 140
                                    )
                                )
                                .blendMode(.screen)
                        }
                        .overlay {
                            // “地獄”火焰感：右側暖色波紋
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .fill(
                                    AngularGradient(
                                        gradient: Gradient(colors: [
                                            Color.clear,
                                            Color(red: 1.0, green: 0.55, blue: 0.25, opacity: configuration.isPressed ? 0.22 : 0.18),
                                            Color(red: 0.95, green: 0.25, blue: 0.22, opacity: configuration.isPressed ? 0.26 : 0.2),
                                            Color.clear
                                        ]),
                                        center: .trailing
                                    )
                                )
                                .mask(
                                    // 水平只保留右半部
                                    LinearGradient(
                                        colors: [Color.black.opacity(0), Color.black],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .blur(radius: configuration.isPressed ? 5 : 8)
                                .blendMode(.plusLighter)
                        }

                    // 內層描邊：左冷右暖的漸層描邊
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .strokeBorder(
                            LinearGradient(
                                colors: [
                                    Color.white.opacity(0.9),
                                    Color(red: 0.85, green: 0.92, blue: 1.0).opacity(0.85),
                                    Color(red: 1.0, green: 0.75, blue: 0.35).opacity(0.8),
                                    Color(red: 0.95, green: 0.35, blue: 0.25).opacity(0.85)
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            ),
                            lineWidth: configuration.isPressed ? 1.5 : 2.0
                        )
                        .opacity(configuration.isPressed ? 0.85 : 1.0)

                    // 外層微光描邊：輕量化
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(
                            LinearGradient(
                                colors: [
                                    Color.white.opacity(configuration.isPressed ? 0.18 : 0.25),
                                    Color.clear,
                                    Color(red: 1.0, green: 0.6, blue: 0.25).opacity(configuration.isPressed ? 0.18 : 0.25)
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            ),
                            lineWidth: configuration.isPressed ? 0.8 : 1.2
                        )
                        .blur(radius: configuration.isPressed ? 1.5 : 3)
                        .blendMode(.screen)
                }
            )
            .overlay(alignment: .topTrailing) {
                // 小圖示點綴：右上角一點星芒
                Circle()
                    .fill(Color.white.opacity(configuration.isPressed ? 0.6 : 0.9))
                    .frame(width: configuration.isPressed ? 4 : 6, height: configuration.isPressed ? 4 : 6)
                    .offset(x: -10, y: 10)
                    .blur(radius: configuration.isPressed ? 0.5 : 0)
            }
            .overlay(alignment: .bottomLeading) {
                // 左下角暖色點
                Circle()
                    .fill(Color(red: 1.0, green: 0.45, blue: 0.25, opacity: configuration.isPressed ? 0.7 : 0.9))
                    .frame(width: configuration.isPressed ? 4 : 6, height: configuration.isPressed ? 4 : 6)
                    .offset(x: 10, y: -10)
                    .blur(radius: configuration.isPressed ? 0.5 : 0)
            }
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .opacity(configuration.isPressed ? 0.96 : 1.0)
            .animation(.easeOut(duration: 0.14), value: configuration.isPressed)
    }
}
