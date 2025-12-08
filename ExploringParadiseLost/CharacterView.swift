//
//  ContentView.swift
//  Demo5
//
//  Created by 114iosClassStudent04 on 2025/10/17.
//

import SwiftUI

struct CharacterView: View {
    
    var body: some View {
        TabView{
            ZStack{
                RoundedRectangle(cornerRadius: 26, style: .continuous)
                    .fill(Color.blue)
                    .opacity(0.3)
                VStack(spacing: 12) {
                    Image("amy")
                        .resizable()
                        .scaledToFit()
                        .padding()

                    Text("エイミー(Amy)")
                        .font(.largeTitle)
                        .bold()
                    Text("才華洋溢但內心脆弱的音樂家")
                        .foregroundStyle(Color.gray)
                    ScrollView(.vertical, showsIndicators: false) {
                        Text("""
                             📌性格與特徵\n
                             ∙自由奔放、感性強烈、叛逆不羈
                               Amy對「藝術的純粹」充滿執念，
                               認為創作應該只屬於感情與靈魂。\n
                             ∙自我矛盾、內向又熱情
                                雖然他渴望表達真實情感，但又
                                對自己被「理解」感到害怕。\n
                             ∙極度浪漫與孤獨。
                                他對生活和藝術的態度浪漫、理想
                                化，但現實的失落讓他心碎。\n
                            📕故事線\n
                            1.創作的起點
                               Amy 年輕時熱愛藝術與音樂，作品
                               真誠動人。Elma 因此深受感動，成
                               為他的後輩。\n
                            2.陷入倦怠與質疑
                               隨著創作受到關注，他開始懷疑藝術
                               是否還「真實」。他覺得自己只是重
                               複別人的形式，失去了最初的純粹。\n
                            3.選擇離開
                               為了追尋「真實的自己」與「自由的
                               藝術」，Amy 決定停止音樂、離開
                               一切。有些解讀認為他「死去」；也
                               有版本暗示他只是遠走他鄉至瑞典。\n          
                            4.留下訊息
                                在離開前，Amy 把自己的錄音、文
                                字、信件交給 Elma。他希望她能「
                                繼續活著」，而非只模仿他。
                            """)
                            .bold()
                            .multilineTextAlignment(.leading)
                            .lineSpacing(3)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 10)
                            .background(.white.opacity(0.8))
                            .cornerRadius(8)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding()
            }
            .padding(.horizontal)

            ZStack {
                RoundedRectangle(cornerRadius: 26, style: .continuous)
                    .fill(Color.green)
                    .opacity(0.3)

                // Make the content hug the top
                VStack(spacing: 12) {
                    Image("Elma 1")
                        .resizable()
                        .scaledToFit()
                        .padding()

                    Text("エルマ(Elma)")
                        .font(.largeTitle)
                        .bold()
                    Text("崇拜Amy、愛著Amy的後輩與繼承者")
                        .foregroundStyle(.gray)
                    ScrollView(.vertical, showsIndicators: false) {
                        Text("""
                            📌性格與特徵\n
                            ∙溫柔、感性、敏銳。
                               她以音樂記錄心境，對周圍情感
                               特別敏銳。\n
                            ∙思考型、內斂。
                               她不像Amy那樣奔放，而是更理性
                               地觀察世界。\n
                            ∙對愛與創作誠實。
                               她愛Amy，也愛他所代表的藝術，
                               但她最終明白：
                              「活著本身就是一種創作。」\n
                            📕故事線\n
                            1.受到啟發
                               Elma年輕時深受Amy的音樂與人格
                               吸引，成為他的學生與伴侶般的存在。\n
                            2.面對失去
                               Amy突然離開，Elma失去依靠與意義
                               ，陷入抑鬱與迷惘。\n
                            3.追尋與理解
                               她閱讀Amy留下的信，前往他曾走過的
                               地方，試著理解他為何放棄音樂。\n
                            4.覺醒與延續
                               她終於領悟：Amy並不是要她模仿他，
                               而是希望她「用自己的方式創作、活
                               著」。她開始用音樂重新述說他們的
                               故事，也完成自我成長。
                            """)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .lineSpacing(3)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 10)
                        .background(.white.opacity(0.8))
                        .cornerRadius(8)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top) // ensure top alignment
                .padding()
            }
            .padding(.horizontal)
            
            ZStack {
                RoundedRectangle(cornerRadius: 26, style: .continuous)
                    .fill(Color.purple)
                    .opacity(0.3)
                
                VStack(spacing: 12) {
                    Image("PlagiarismCover")
                        .resizable()
                        .scaledToFit()
                        .padding()
                    
                    Text("剽竊音樂的男人")
                        .font(.largeTitle)
                        .bold()
                    
                    Text("《盗作》專輯主角")
                        .foregroundStyle(.gray)
                    ScrollView(.vertical, showsIndicators: false) {
                        Text("""
                            📌性格與特徵\n
                            ∙自稱為「音樂的小偷」，對旋律和音樂
                               抱有強烈、甚至病態的渴求。他認為
                              「一切音樂皆為古典時代的複製品」的
                               念頭，在他內心中反覆盤旋。\n
                            ∙自我否定、自我懷疑的傾向：
                               雖然生成、改編、剽竊音樂，但同時
                               他也意識到自己所做的「剽竊」行為，
                               是對創作的一種破壞和背叛。\n
                            ∙經歷個人生活的創傷，比如妻子離世，
                               對父親的態度也帶有強烈的不滿或
                               痛苦記憶。這些個人經歷在故事中
                               成為他創作與剽竊衝動的背景。\n
                            📕故事線\n
                            ∙故事發生在這位「剽竊音樂的男人」，
                               他從青年／成熟階段開始，對音樂產生
                               強烈的吸引。他回憶起自己父親、妻子
                               、少年時期的種種。\n
                            ∙他不僅僅「創作」音樂，而是「盜取」
                               他人或既存的旋律、錄音、音樂記憶，
                               然後改編、再製，成為自己的作品。
                               這成為他自我身份的一部分。\n
                            ∙在他的生活中，他遇見一位少年，
                               而這少年成為故事中對比的一方：
                               少年對音樂、對生活充滿好奇，而
                               他自己則帶著疲憊與創作的負擔。\n
                            ∙從回憶的過程與故事敘述來看，他
                               最終面對的是創作與倫理、原創
                               與剽竊、生命與藝術之間的拉扯。
                               他的「剽竊」不只是對他人作品的
                               模仿，更像是他對音樂「美」的執
                               著，他想把那份「美」據為己有。\n
                            ∙最後，當其「暴露」或其行為被世人
                               知曉，他承認：「我是個小偷。」
                               ，並面對社會的唾棄與自身的虛無。
                            """)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .lineSpacing(3)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 10)
                        .background(.white.opacity(0.8))
                        .cornerRadius(8)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top) // ensure top alignment
                .padding()
            }
            .padding(.horizontal)
        }
        .tabViewStyle(.page)
        .background{
            Image("Yorushika_Logo 1")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
                .opacity(0.4)
        }
    }
}

#Preview {
    CharacterView()
}
