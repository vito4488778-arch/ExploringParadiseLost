//
//  ContentView.swift
//  ExploringParadiseLost
//
//  Created by 114iosClassStudent04 on 2025/12/2.
//



import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var QisPresented = false
    @State private var RisPresented = false
    @State private var CisPresented = false
    @State private var isMute = false
    @State private var looper: AVPlayerLooper?

    // 圖片輪播控制
    @State private var showFirstImage = true
    @State private var hasAppeared = false

    let player = AVQueuePlayer()
    // 自動切換的間隔秒數
    private let switchInterval: TimeInterval = 4.0

    var body: some View {
        NavigationStack{
            ZStack {
                // 背景
                Image("PLbackground")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.4)
                    .ignoresSafeArea()
                
                // 主要內容
                VStack(spacing: 0) {
                    
                    // 頂部控制列：左喇叭、右清單
                    HStack {
                        // 播放按鈕（左）
                        Image(systemName: isMute ? "speaker.slash.fill" : "speaker.fill")
                            .foregroundColor(.black)
                            .font(.system(size: 35))
                            .frame(width: 44, height: 44, alignment: .center)
                            .contentShape(Rectangle())
                            .onAppear {
                                if player.currentItem == nil {
                                    let url = Bundle.main.url(forResource: "PLMusic", withExtension: "mp3")!
                                    let playingItem = AVPlayerItem(url: url)
                                    self.looper = AVPlayerLooper(player: player, templateItem: playingItem)
                                    player.play()
                                }
                            }
                            .onTapGesture {
                                isMute.toggle()
                                if isMute {
                                    player.pause()
                                } else {
                                    player.play()
                                }
                            }
                        
                        // 清單按鈕（右）
                        NavigationLink(destination: ListView()) {
                            Image(systemName: "list.bullet")
                                .foregroundColor(.black)
                                .font(.system(size: 30))
                                .frame(width: 44, height: 44, alignment: .center)
                                .contentShape(Rectangle())
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                    
                    Text("Paradise Lost") // 標題
                        .font(.custom("DK Paradise Lost", size: 100))
                        .multilineTextAlignment(.center)
                        .padding(.top, 12)
                    
                    // 輪流顯示兩張圖片
                    ZStack {
                        if showFirstImage {
                            Image("ContentViewImage1")
                                .resizable()
                                .scaledToFit()
                                .transition(
                                    .asymmetric(
                                        insertion: .opacity.combined(with: .scale(scale: 1.02)).animation(.easeIn(duration: 0.6)),
                                        removal: .opacity.combined(with: .scale(scale: 0.98)).animation(.easeOut(duration: 0.6))
                                    )
                                )
                        } else {
                            Image("ContentViewImage2")
                                .resizable()
                                .scaledToFit()
                                .transition(
                                    .asymmetric(
                                        insertion: .opacity.combined(with: .scale(scale: 1.02)).animation(.easeIn(duration: 0.6)),
                                        removal: .opacity.combined(with: .scale(scale: 0.98)).animation(.easeOut(duration: 0.6))
                                    )
                                )
                        }
                    }
                    // 初次進入時淡入
                    .opacity(hasAppeared ? 1 : 0)
                    .animation(.easeIn(duration: 0.6), value: hasAppeared)
                    // 每次切換圖片時的整體動畫
                    .animation(.easeInOut(duration: 0.6), value: showFirstImage)
                    // 啟動自動輪播
                    .onAppear {
                        hasAppeared = true
                        startAutoSwitching()
                    }
                    
                    // 三個主要按鈕
                    Button("Gain some knowledge") { // 選擇題按鈕
                        QisPresented = true
                    }
                    .buttonStyle(HeavenButtonStyle())
                    .font(.system(size: 20, design: .serif))
                    .padding(20)
                    .fullScreenCover(isPresented: $QisPresented) {
                        QuestionView()
                    }
                    
                    Button("Learn some characters") {  // 角色介紹按鈕
                        CisPresented = true
                    }
                    .buttonStyle(HellfireButtonStyle())
                    .font(.system(size: 20, design: .serif))
                    .padding(20)
                    .sheet(isPresented: $CisPresented) {
                        CharacterView()
                    }
                    
                    Button("Read some passages") {  // 閱讀文章按鈕
                        RisPresented = true
                    }
                    .buttonStyle(ReadingButtonStyle())
                    .font(.system(size: 20, design: .serif))
                    .padding(20)
                    .fullScreenCover(isPresented: $RisPresented) {
                        ReadingView()
                    }
                    
                    Spacer(minLength: 20)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(.horizontal, 16)
            }
        }
        
    }

    private func startAutoSwitching() {
        // 使用 Timer 每 switchInterval 秒切換一次
        Timer.scheduledTimer(withTimeInterval: switchInterval, repeats: true) { _ in
            withAnimation(.easeInOut(duration: 0.6)) {
                showFirstImage.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
