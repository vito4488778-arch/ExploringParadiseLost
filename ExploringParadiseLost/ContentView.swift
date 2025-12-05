//
//  ContentView.swift
//  ExploringParadiseLost
//
//  Created by 114iosClassStudent04 on 2025/12/2.
//

import SwiftUI

struct ContentView: View {
    @State private var QisPresented = false
    var body: some View {
        ZStack {
            Image("PLbackground")
                .resizable()
                .scaledToFill()
                .opacity(0.4)
                .ignoresSafeArea()

            VStack(spacing: 16) {
                Text("Paradise Lost")
                    .font(.custom("DK Paradise Lost", size: 100))
                    .multilineTextAlignment(.center)
                    .padding(.top, 12)

                Button("Gain some knowledge") {
                    QisPresented = true
                }
                .buttonStyle(HeavenButtonStyle())
                .font(.system(size: 20, design: .default))
                .padding(20)
                .sheet(isPresented: $QisPresented) {
                    QuestionView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    ContentView()
}
