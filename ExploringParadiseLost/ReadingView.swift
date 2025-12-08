//
//  ReadingView.swift
//  ExploringParadiseLost
//
//  Created by 114iosClassStudent04 on 2025/12/6.
//

import SwiftUI
import MarkdownUI

struct BookContent: Identifiable {
    let id: Int
    let title: String
    let originalText: String
    let translation: String
    let context: String
}

struct ReadingView: View {
    // 用於關閉視圖（支援 sheet 或 Navigation 返回）
    @Environment(\.dismiss) private var dismiss

    // State 屬性
    @State private var currentBook: Int = 1
    @State private var isBookmarked: Bool = false
    @State private var showSettings: Bool = false
    @State private var showSearch: Bool = false
    @State private var searchQuery: String = ""
    @State private var readingProgress: CGFloat = 0.0
    @State private var showCompletionAlert: Bool = false
    
    // 進度量測暫存
    @State private var lastContentHeight: CGFloat = 1
    @State private var currentOffsetY: CGFloat = 0
    @State private var didFireCompletionForBookID: Int? = nil
    
    // AppStorage - 持久化儲存
    @AppStorage("fontSize") private var fontSize: Double = 16
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @AppStorage("showOriginalText") private var showOriginalText: Bool = true
    
    // 書籍內容資料
    let books: [BookContent] = [
        BookContent(
            id: 1,
            title: "Book I: The Fall of Satan",
            originalText: """
            ## Invocation

            Of Man's first disobedience, and the fruit  
            Of that forbidden tree whose mortal taste  
            Brought death into the World, and all our woe,  
            With loss of Eden, till one greater Man  
            Restore us, and regain the blissful seat,  
            Sing, **Heavenly Muse**...

            > Better to reign in Hell, than serve in Heaven.

            """,
            translation: """
            ## 開場祈請

            關於人類最初的違命，以及那禁果  
            其致命的滋味帶來死亡降臨世間，  
            連同所有的悲哀，失去了伊甸園，  
            直到一位更偉大的人  
            拯救我們，重獲那幸福的居所，  
            歌唱吧，**天國的繆斯**...

            > 在地獄為王，勝過在天堂為僕。
            """,
            context: "撒旦和其他墮落天使被逐出天堂後，在地獄中重新集結。撒旦發表演說，激勵他的追隨者不要放棄對抗上帝的希望。"
        ),
        BookContent(
            id: 2,
            title: "Book II: Satan's Council",
            originalText: """
            ## Council in Pandemonium

            High on a throne of royal state, which far  
            Outshone the wealth of Ormus and of Ind,  
            Or where the gorgeous East with richest hand  
            Showers on her kings barbaric pearl and gold,  
            Satan exalted sat...

            - Debate among the fallen angels
            - Plans to corrupt the newly created world
            """,
            translation: """
            ## 地獄議會

            高踞王座之上，其輝煌遠超  
            奧爾穆斯與印度的財富，  
            或華麗的東方以最豐富的手  
            將野蠻的珍珠與黃金灑向她的國王，  
            撒旦高傲地坐著...

            - 墮落天使之間的辯論
            - 著手計畫腐化新創造的世界
            """,
            context: "撒旦召開地獄議會，討論如何報復上帝。最終決定前往新創造的世界——地球，引誘人類墮落。"
        )
    ]
    
    var currentContent: BookContent {
        books.first { $0.id == currentBook } ?? books[0]
    }
    
    // Option B: 以 16 為基準建立縮放係數，並定義基準字級
    private var scale: CGFloat { max(0.5, CGFloat(fontSize / 16.0)) }
    private let chapterTitleBase: CGFloat = 24
    private let sectionHeaderBase: CGFloat = 18
    private let contextBodyBase: CGFloat = 14
    private let authorSubtitleBase: CGFloat = 12
    private let buttonTextBase: CGFloat = 16
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                // 背景：深色模式改為深灰
                (isDarkMode ? Color(white: 0.12) : Color(red: 0.98, green: 0.96, blue: 0.92))
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // 頂部工具列
                    topToolbar
                    
                    // 搜尋欄（條件顯示）
                    if showSearch {
                        searchBar
                            .transition(.move(edge: .top).combined(with: .opacity))
                    }
                    
                    // 設定面板（Sheet 方式）
                    if showSettings {
                        settingsPanel
                            .transition(.move(edge: .top).combined(with: .opacity))
                    }
                    
                    // 主要內容區域（加入進度量測）
                    GeometryReader { outerGeo in
                        ScrollView {
                            ZStack(alignment: .top) {
                                // 用來量測捲動偏移（相對於 outerGeo）
                                Color.clear
                                    .frame(height: 0)
                                    .anchorPreference(key: ScrollOffsetKey.self, value: .top) { anchor in
                                        outerGeo[anchor].y
                                    }
                                
                                VStack(alignment: .center, spacing: 20) {
                                    // 章節標題
                                    Text(currentContent.title)
                                        .font(.system(size: chapterTitleBase * scale, weight: .bold, design: .serif))
                                        .foregroundColor(isDarkMode ? .white : .primary)
                                        .multilineTextAlignment(.center)
                                        .frame(maxWidth: 700)
                                        .padding(.top)
                                    
                                    // 背景註釋
                                    contextCard
                                        .frame(maxWidth: 700)
                                    
                                    // 英文原文（條件顯示）
                                    if showOriginalText {
                                        originalTextSection
                                            .frame(maxWidth: 700, alignment: .leading)
                                            .transition(.opacity)
                                    }
                                    
                                    // 中文翻譯
                                    translationSection
                                        .frame(maxWidth: 700, alignment: .leading)
                                    
                                    // 額外內容
                                    additionalContent
                                        .frame(maxWidth: 700, alignment: .leading)
                                }
                                // 置中顯示閱讀欄寬度
                                .frame(maxWidth: .infinity, alignment: .center)
                                // 回報內容總高度
                                .background(
                                    GeometryReader { contentGeo in
                                        Color.clear
                                            .preference(key: ContentHeightKey.self, value: contentGeo.size.height)
                                    }
                                )
                                .padding(.horizontal) // 手機上留一點側邊間距
                            }
                        }
                        // 接收內容高度變化
                        .onPreferenceChange(ContentHeightKey.self) { contentHeight in
                            updateProgressIfPossible(viewportHeight: outerGeo.size.height,
                                                     contentHeight: contentHeight,
                                                     offsetY: currentOffsetY)
                        }
                        // 接收捲動偏移變化
                        .onPreferenceChange(ScrollOffsetKey.self) { offset in
                            currentOffsetY = -offset // 轉成正值代表已捲動距離
                            updateProgressIfPossible(viewportHeight: outerGeo.size.height,
                                                     contentHeight: lastContentHeight,
                                                     offsetY: currentOffsetY)
                        }
                    }
                }
                
                // 底部工具列
                bottomToolbar
            }
            .navigationBarHidden(true)
        }
        // Alert - 完成章節（讀到結尾或按下一章但已是最後一章）
        .alert("恭喜完成 \(currentContent.title)！", isPresented: $showCompletionAlert) {
            Button("繼續下一章") {
                if currentBook < books.count {
                    withAnimation {
                        currentBook += 1
                        // 重置完成旗標，避免一打開下一章就馬上彈窗
                        didFireCompletionForBookID = nil
                        readingProgress = 0
                    }
                }
            }
            Button("返回目錄", role: .cancel) { }
        } message: {
            Text("您已閱讀完本章，準備好探索下一段史詩了嗎？")
        }
        // 動畫設定
        .animation(.easeInOut(duration: 0.3), value: showSettings)
        .animation(.easeInOut(duration: 0.3), value: showSearch)
        .animation(.spring(), value: isBookmarked)
        // 切換章節時重置進度與完成旗標
        .onChange(of: currentBook) { _, _ in
            readingProgress = 0
            didFireCompletionForBookID = nil
        }
    }
    
    // MARK: - 進度計算與完成判定
    private func updateProgressIfPossible(viewportHeight: CGFloat, contentHeight: CGFloat, offsetY: CGFloat) {
        lastContentHeight = max(contentHeight, 1)
        let scrollable = max(contentHeight - viewportHeight, 1)
        let ratio = min(max(offsetY / scrollable, 0), 1)
        withAnimation(.easeInOut(duration: 0.12)) {
            readingProgress = ratio
        }
        
        // 若已到達底部（例如 >= 0.99），且尚未對此章節觸發過完成提示，則顯示 Alert
        if ratio >= 0.99, didFireCompletionForBookID != currentContent.id {
            didFireCompletionForBookID = currentContent.id
            showCompletionAlert = true
        }
    }
    
    // MARK: - 共用的 Markdown 主題
    private var currentMarkdownTheme: Theme {
        let base = Theme()
            .text {
                FontSize(.em(fontSize / 16.0))
                ForegroundColor(isDarkMode ? .white : .black)
                BackgroundColor(isDarkMode ? Color(white: 0.12) : Color.clear)
            }
            .emphasis { FontStyle(.italic) }
            .strong { FontWeight(.semibold) }
            .link { ForegroundColor(.blue) }
            .paragraph { configuration in
                configuration.label
                    .relativeLineSpacing(.em(0.5))
                    .markdownMargin(top: .em(0.6), bottom: .em(0.8))
            }
            .heading2 { configuration in
                configuration.label
                    .markdownTextStyle {
                        FontWeight(.bold)
                        FontSize(.em(1.25 * fontSize / 16.0))
                        ForegroundColor(isDarkMode ? .white : .primary)
                    }
                    .markdownMargin(top: .em(1.0), bottom: .em(0.6))
            }
            .blockquote { configuration in
                configuration.label
                    .markdownTextStyle {
                        BackgroundColor(isDarkMode ? Color.white.opacity(0.08) : Color.blue.opacity(0.08))
                        ForegroundColor(isDarkMode ? .white : .black)
                    }
                    .padding(.vertical, 6)
                    .padding(.horizontal, 10)
                    .overlay(alignment: .leading) {
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 3)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .markdownMargin(top: .em(0.8), bottom: .em(0.8))
            }
            .list { configuration in
                configuration.label
                    .markdownMargin(top: .em(0.4), bottom: .em(0.4))
            }
            .codeBlock { configuration in
                configuration.label
                    .markdownTextStyle {
                        FontFamilyVariant(.monospaced)
                        BackgroundColor(isDarkMode ? Color.white.opacity(0.08) : Color.black.opacity(0.05))
                        ForegroundColor(isDarkMode ? .white : .primary)
                    }
                    .padding(8)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .markdownMargin(top: .em(0.8), bottom: .em(0.8))
            }
        return base
    }
    
    // 頂部工具列
    var topToolbar: some View {
        VStack(spacing: 0) {
            HStack {
                // 返回按鈕
                Button {
                    dismiss() // 關閉本頁（sheet 或返回上一層）
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 20 * scale, weight: .semibold))
                        .foregroundColor(isDarkMode ? .white : .black)
                        .frame(width: 44, height: 44)
                }
                
                Spacer()
                
                // 標題區域
                VStack(spacing: 2) {
                    Text("Book \(currentBook)")
                        .font(.system(size: sectionHeaderBase * scale, weight: .bold))
                        .foregroundColor(isDarkMode ? .white : .primary)
                    Text("John Milton")
                        .font(.system(size: authorSubtitleBase * scale))
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                // 右側按鈕
                HStack(spacing: 8) {
                    Button {
                        withAnimation {
                            showSearch.toggle()
                        }
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 18 * scale))
                            .foregroundColor(isDarkMode ? .white : .black)
                            .frame(width: 40, height: 40)
                    }
                    
                    Button {
                        withAnimation {
                            showSettings.toggle()
                        }
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .font(.system(size: 18 * scale))
                            .foregroundColor(isDarkMode ? .white : .black)
                            .frame(width: 40, height: 40)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 12)
            // 深色模式工具列背景改成灰色
            .background(isDarkMode ? Color(white: 0.15) : Color.white)
            
            // 進度條
            ZStack(alignment: .leading){
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                Rectangle()
                    .fill(Color.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .mask(GeometryReader{
                        proxy in Color.white.frame(width: max(0, proxy.size.width * readingProgress ))
                    })
                    .animation(.easeInOut, value: readingProgress)
            }
            .frame(height: 3)
            .frame(maxWidth: .infinity)
        }
        .shadow(color: .black.opacity(0.1), radius: 5, y: 2)
    }
    
    // 搜尋欄
    var searchBar: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("搜尋詩句...", text: $searchQuery)
                    .textFieldStyle(.plain)
                    .font(.system(size: contextBodyBase * scale))
                    .foregroundColor(isDarkMode ? .white : .primary)
                
                if !searchQuery.isEmpty {
                    Button {
                        searchQuery = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                            .font(.system(size: 16 * scale))
                    }
                }
            }
            .padding(12)
            .background(isDarkMode ? Color(white: 0.2) : Color(white: 0.95))
            .cornerRadius(10)
            .padding()
        }
        .background(isDarkMode ? Color(white: 0.15) : Color.white)
    }
    
    // 設定面板
    var settingsPanel: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "gearshape.fill")
                Text("閱讀設定")
                    .font(.system(size: sectionHeaderBase * scale, weight: .bold))
                    .foregroundColor(isDarkMode ? .white : .primary)
            }
            .padding(.bottom, 8)
            
            // 字體大小調整 - Slider
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: "textformat.size")
                    Text("字體大小")
                        .font(.system(size: contextBodyBase * scale))
                    Spacer()
                    Text("\(Int(fontSize)) pt")
                        .font(.system(size: contextBodyBase * scale))
                        .foregroundColor(.secondary)
                }
                
                Slider(value: $fontSize, in: 12...28, step: 2)
                    .tint(.blue)
            }
            
            Divider()
            
            // 深色模式 - Toggle
            Toggle(isOn: $isDarkMode) {
                HStack {
                    Image(systemName: isDarkMode ? "moon.fill" : "sun.max.fill")
                    Text("深色模式")
                        .font(.system(size: contextBodyBase * scale))
                }
                .foregroundColor(isDarkMode ? .white : .primary)
            }
            .tint(.blue)
            
            Divider()
            
            // 顯示原文 - Toggle
            Toggle(isOn: $showOriginalText) {
                HStack {
                    Image(systemName: "book.fill")
                    Text("顯示英文原文")
                        .font(.system(size: contextBodyBase * scale))
                }
                .foregroundColor(isDarkMode ? .white : .primary)
            }
            .tint(.blue)
            
            Divider()
            
        }
        .padding()
        .background(isDarkMode ? Color(white: 0.15) : Color(white: 0.98))
        .cornerRadius(15)
        .shadow(radius: 10)
        .padding()
    }
    
    // 背景註釋卡片
    var contextCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "book.closed.fill")
                    .foregroundColor(.blue)
                Text("背景介紹")
                    .font(.system(size: sectionHeaderBase * scale, weight: .semibold))
                    .foregroundColor(isDarkMode ? .white : .primary)
            }
            
            Text(currentContent.context)
                .font(.system(size: contextBodyBase * scale))
                .foregroundColor(isDarkMode ? Color.white.opacity(0.85) : .secondary)
                .lineSpacing(4)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(isDarkMode ? Color.blue.opacity(0.18) : Color.blue.opacity(0.1))
        )
    }
    
    // 英文原文區塊（Markdown）
    var originalTextSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Original Text")
                .font(.system(size: sectionHeaderBase * scale, weight: .semibold))
                .foregroundColor(isDarkMode ? .white : .primary)
            
            Markdown(currentContent.originalText)
                .markdownTheme(currentMarkdownTheme)
        }
    }
    
    // 中文翻譯區塊（Markdown）
    var translationSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("中文翻譯")
                .font(.system(size: sectionHeaderBase * scale, weight: .semibold))
                .foregroundColor(isDarkMode ? .white : .primary)
            
            Markdown(currentContent.translation)
                .markdownTheme(currentMarkdownTheme)
        }
    }
    
    // 額外內容（Markdown 範例：引言、清單、分隔線）
    var additionalContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            Markdown {
                """
                > 撒旦從地獄的硫磺湖中站起，他的眼中閃爍著不屈的火焰。  
                > 儘管被逐出天堂，他仍拒絕向上帝臣服。
                """
                """
                ---
                - 主題：自由意志
                - 主題：驕傲
                - 主題：反叛
                """
            }
            .markdownTheme(currentMarkdownTheme)
        }
    }
    
    // 底部工具列
    var bottomToolbar: some View {
        HStack {
            // 上一章按鈕
            Button {
                if currentBook > 1 {
                    withAnimation {
                        currentBook -= 1
                    }
                }
            } label: {
                Text("上一章")
                    .font(.system(size: buttonTextBase * scale, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 100, height: 44)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(currentBook > 1 ? Color.blue : Color.gray)
                    )
            }
            .disabled(currentBook == 1)
            
            Spacer()
            
            // 書籤按鈕
            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                    isBookmarked.toggle()
                }
            } label: {
                Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                    .font(.system(size: 24 * scale))
                    .foregroundColor(isBookmarked ? .yellow : .gray)
                    .scaleEffect(isBookmarked ? 1.2 : 1.0)
                    .frame(width: 50, height: 50)
            }
            
            Spacer()
            
            // 下一章按鈕
            Button {
                if currentBook < books.count {
                    withAnimation {
                        currentBook += 1
                    }
                } else {
                    showCompletionAlert = true
                }
            } label: {
                Text("下一章")
                    .font(.system(size: buttonTextBase * scale, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 100, height: 44)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(currentBook < books.count ? Color.blue : Color.gray)
                    )
            }
            .disabled(currentBook == books.count)
        }
        .padding()
        .background(
            Rectangle()
                .fill(isDarkMode ? Color(white: 0.15) : Color.white)
                .shadow(color: .black.opacity(0.1), radius: 5, y: -2)
        )
    }
}

// MARK: - PreferenceKeys for progress tracking
private struct ContentHeightKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) { value = nextValue() }
}

private struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) { value = nextValue() }
}

#Preview {
    ReadingView()
}
