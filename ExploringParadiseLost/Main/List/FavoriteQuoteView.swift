//
//  FavorieLineView.swift
//  ExploringParadiseLost
//
//  Created by 114iosClassStudent04 on 2025/12/8.
//

import SwiftUI

struct FavoriteQuoteView: View {
    // 使用英文作為 Key 值與預設值
    @Environment(\.dismiss) var dismiss
    @AppStorage("saved_quote") var savedQuote: String = "No quotes saved yet."
    @State private var inputQuote: String = ""

    var body: some View {
        ZStack{
            Image("FavoriteBackground") // 背景
                .resizable()
                .scaledToFill()
                .containerRelativeFrame(.horizontal)
                .opacity(0.5)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .symbolRenderingMode(.monochrome)
                            .foregroundColor(.black)
                            .font(.system(size: 28, weight: .bold)) // larger symbol
                            .frame(width: 44, height: 44) // smaller to sit closer to corner while keeping accessibility
                    }
                    Spacer()
                }
                .padding(.top, 2)
                .padding(.leading, 2)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                // Title
                Text("📜 My Collection")
                    .font(.largeTitle.bold())
                
                // Display Area
                VStack(alignment: .leading, spacing: 8) {
                    Text("CURRENT FAVORITE")
                        .font(.caption.bold())
                        .foregroundColor(.secondary)
                    
                    Text("\"\(savedQuote)\"")
                        .font(.title3)
                        .italic()
                        .foregroundColor(.primary)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 12).fill(Color.secondary.opacity(0.1)))
                }
                .padding(.horizontal)
                
                // Input Area
                VStack(spacing: 15) {
                    TextField("Type a quote to save...", text: $inputQuote)
                        .textFieldStyle(.plain)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.5)))
                        .padding(.horizontal)
                    
                    Button(action: {
                        if !inputQuote.isEmpty {
                            savedQuote = inputQuote
                            inputQuote = ""
                            // 隱藏鍵盤 (選用)
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }
                    }) {
                        HStack {
                            Image(systemName: "star.fill")
                            Text("Save to Favorites")
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                        .padding(.horizontal)
                    }
                }
                
                Spacer()
            }
            .padding(.top, 24) // reduced from 50 so content sits higher while keeping safe area
        }
    }
}


#Preview {
    FavoriteQuoteView()
}
