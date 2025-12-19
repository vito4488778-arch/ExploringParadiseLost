//
//  CreateBackgroundView.swift
//  ExploringParadiseLost
//
//  Created by 114iosClassStudent04 on 2025/12/12.
//

import SwiftUI
import MarkdownUI

struct CreateBackgroundView: View {
    // 要輪播的句子，支援 Markdown 語法
    private let lines: [String] = [
        """
        1. **The Lifelong Ambition**
        """,
        """
        Since his youth, Milton felt "destined" to write a masterpiece 
        in the English language. 
        """,
        "- Early Plans: Originally, Milton didn’t plan to write about the Bible.",
        "He spent years considering the **Arthurian Legends** (the story of King Arthur) as his subject.",
        "- The Shift: In the 1640s, his interests shifted toward **theological** and **universal** themes.",
        "He began drafting \"Paradise Lost\" as a tragedy/play *(tentatively titled 'Adam Unparadised')*before finally deciding on the **epic poem** format.",
        "2. **The Political Context (The Restoration)**",
        "- **The Republican Dream**: Milton was a high-ranking official in Oliver Cromwell’s government. He spent nearly twenty years writing political tracts instead of poetry, defending the execution of King Charles I.",
        "- **The Fall**: When the monarchy was restored in 1660 (The Restoration), Milton’s world collapsed. He was arrested, narrowly escaped execution, and lost his fortune.",
        """
        - **Writing in Defeat**: Many scholars believe Milton’s portrayal of the fallen Rebel Angels reflects his own feelings of being a defeated revolutionary. He wrote the poem to "justify the ways of God to men," trying to make sense of why a righteous cause (the Republic) had failed.
        """,
        """
        3. **The "Blind Prophet" and the Composition.**
        """,
        "Perhaps the most famous aspect of the poem's creation is that Milton was completely blind when he wrote the majority of it.",
        """
        - **Dictation**: Milton would compose lines in his head overnight—describing it as being "milked"—and then dictate them to his daughters or assistants the next morning.
        """,
        """
        - **The Muse**: He claimed he was inspired by a "Celestial Patroness" (the Holy Spirit) who visited him in his sleep and dictated the verses to him.
        """,
        "4. **The World-Building (Cosmic Geography)**",
        """
        To tell the story of the Fall, Milton had to create a specific physical universe. Unlike our modern solar system, Milton used a modified **Ptolemaic (Geocentric)** model for his poetic landscape, which allowed for a dramatic vertical hierarchy.
        """,
        "- **Heaven (The Empyrean)**: At the very top, the realm of light and God.",
        """
        - **Chaos** : A turbulent, unformed region of "dark materials" separating Heaven from Hell.
        """,
        "- **Hell (Tartarus)**: At the absolute bottom, created specifically to imprison the fallen angels.",
        "- **The World (Earth)**: A small, perfect sphere hanging from Heaven by a golden chain, where Adam and Eve reside.",
        "5. **Publication History**",
        "- **1667 Edition**: The poem was first published in ten books. It was not an immediate bestseller, partly because Milton was a political pariah.",
        """
        - **1674 Edition**: Shortly before his death, Milton reorganized the poem into twelve books (modeling it after Virgil’s Aeneid). He also added "The Argument"—prose summaries at the start of each book—to help readers follow the complex plot.
        """,
        "**Summary of Intent**: Milton wrote Paradise Lost not just to tell a story, but to explore the nature of Free Will.",
        """
        He wanted to show that while God is all-powerful, humans (and angels) are "Sufficient to have stood, though free to fall.
        """
    ]
    
    // 設定每句停留秒數
    private let interval: TimeInterval = 5.0
    
    @State private var currentIndex: Int = 0
    @State private var fadeIn: Bool = true
    @State private var timer: Timer? = nil
    
    var body: some View {
        ZStack{
            Image("CreateBackgroundImage")
                .resizable()
                .scaledToFill()
                .containerRelativeFrame(.horizontal)
                .opacity(0.5)
                .ignoresSafeArea()
            
            // 文字覆蓋層
            VStack {
                Text("Contextual Background") // 標題
                    .font(.custom("SymphonieCalligraphyDEMO-Regular", size: 50))
                    .multilineTextAlignment(.center)
                    .padding(.top, 12)
                
                Spacer()
                
                // 使用 Markdown 呈現輪播內容
                Markdown(lines[currentIndex])
                    .markdownTheme(
                        .gitHub
                            .text {
                                FontSize(32)                // 放大字級（MarkdownUI TextStyle）
                                FontWeight(.semibold)       // 粗細（MarkdownUI TextStyle）
                                ForegroundColor(.white)     // 顏色（MarkdownUI TextStyle）
                            }
                    )
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(Color.black.opacity(0.45))
                    )
                    .opacity(fadeIn ? 1.0 : 0.0)
                    .animation(.easeInOut(duration: 0.5), value: fadeIn)
                
                Spacer()
            }
            .padding()
        }
        .onAppear {
            startCarousel()
        }
        .onDisappear {
            stopCarousel()
        }
    }
    
    private func startCarousel() {
        // 先確保沒有殘留計時器
        stopCarousel()
        
        // 啟動時先顯示淡入
        fadeIn = true
        
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
            // 先淡出再切換文字再淡入
            withAnimation(.easeInOut(duration: 0.35)) {
                fadeIn = false
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                currentIndex = (currentIndex + 1) % lines.count
                withAnimation(.easeInOut(duration: 0.35)) {
                    fadeIn = true
                }
            }
        }
        // 確保在 run loop 中運作於 common modes（避免與 Scroll 等互搶）
        RunLoop.main.add(timer!, forMode: .common)
    }
    
    private func stopCarousel() {
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    CreateBackgroundView()
}
