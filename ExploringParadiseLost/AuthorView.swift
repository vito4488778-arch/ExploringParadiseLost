//
//  AuthorView.swift
//  ExploringParadiseLost
//
//  Created by 114iosClassStudent04 on 2025/12/8.
//

import SwiftUI

struct AuthorView: View {
    @State private var flipped = false
    var body: some View {
        TabView{
            ZStack{
                VStack{
                    Text("Englishman") // 標題
                        .font(.custom("SymphonieCalligraphyDEMO-Regular", size: 50))
                        .multilineTextAlignment(.center)
                        .padding(.top, 12)
                    
                    Image(flipped ? .authorInfo : .authorInfoBack)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 600)
                        .shadow(
                            color: .black,
                            radius: flipped ? 20 : 10,
                            y: flipped ? 20 : 10
                        )
                        .rotation3DEffect(
                            .degrees(flipped ? 360 : 0),
                            axis: (x: 0, y: 1, z: 0)
                        )
                        .onTapGesture {
                            withAnimation {
                                flipped.toggle()
                            }
                        }
                }
                
            }
            ZStack{
                
            }
        }
        .tabViewStyle(.page)
        .background{
            Image("AuthorBackground")
                .resizable()
                .scaledToFill()
                .containerRelativeFrame(.horizontal)
                .opacity(0.5)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    AuthorView()
}
