//
//  AuthorView.swift
//  ExploringParadiseLost
//
//  Created by 114iosClassStudent04 on 2025/12/8.
//

import SwiftUI
import MarkdownUI

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
                RoundedRectangle(cornerRadius: 26, style: .continuous)
                    .fill(Color(red: 237/255, green: 205/255, blue: 130/255))
                    .opacity(0.3)
                VStack{
                    Text("Works") // 標題
                        .font(.custom("SymphonieCalligraphyDEMO-Regular", size: 50))
                        .multilineTextAlignment(.center)
                        .padding(.top, 12)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        // 使用 Markdown 呈現
                        Markdown("""
                    ### John Milton
                    
                    John Milton (9 December 1608 – 8 November 1674) was an English poet, polemicist, and civil servant. His 1667 epic poem Paradise Lost was written in blank verse and included 12 books, written in a time of immense religious flux and political upheaval. It addressed the fall of man, including the temptation of Adam and Eve by the fallen angel Satan, and God's expulsion of them from the Garden of Eden. Paradise Lost elevated Milton's reputation as one of history's greatest poets. He also served as a civil servant for the Commonwealth of England under its Council of State and later under Oliver Cromwell.  
                    
                     **Milton achieved fame and recognition during his lifetime. His celebrated Areopagitica (1644) condemning pre-publication censorship is among history's most influential and impassioned defences of freedom of speech and freedom of the press. His desire for freedom extended beyond his philosophy and was reflected in his style, which included his introduction of new words to the English language, coined from Latin and Ancient Greek. He was the first modern writer to employ unrhymed verse outside of the theatre or translations.**
                    
                    Milton is described as the "greatest English author" by his biographer William Hayley, and he remains generally regarded "as one of the preeminent writers in the English language", though critical reception has oscillated in the centuries since his death, often on account of his republicanism. Samuel Johnson praised Paradise Lost as "a poem which ... with respect to design may claim the first place, and with respect to performance, the second, among the productions of the human mind", though he (a Tory) described Milton's politics as those of an "acrimonious and surly republican". Milton was revered by poets such as William Blake, William Wordsworth, and Thomas Hardy.
                    
                    #### Poetry and Drama
                    - On the Morning of Christ's Nativity (1629)
                    - The Passion (1630)
                    - Upon the Circumcision (1633)
                    - L'Allegro (1630s)
                    - Il Penseroso (1630s)
                    - Arcades (1634)
                    - Comus (1634)
                    - Lycidas (1637)
                    - Milton's 1645 Poems (1645)
                    - Paradise Lost (1667)
                    - Paradise Regained (1671)
                    - Samson Agonistes (1671)
                    
                    #### Prose
                    - Of Reformation (1641)
                    - Of Prelatical Episcopacy (1641)
                    - Animadversions (1641)
                    - The Reason of Church-Government Urged against Prelaty (1642)
                    - Apology for Smectymnuus (1642)
                    - Doctrine and Discipline of Divorce (1643)
                    - Judgement of Martin Bucer Concerning Divorce (1644)
                    - Of Education (1644)
                    - Areopagitica (1644)
                    - Tetrachordon (1645)
                    - Colasterion (1645)
                    - The Tenure of Kings and Magistrates (1649)
                    - Eikonoklastes (1649)
                    - Defensio pro Populo Anglicano (1651)
                    - Defensio Secunda (1654)
                    - A Treatise of Civil Power (1659)
                    - The Ready and Easy Way to Establish a Free Commonwealth (1660)
                    - The History of Britain (1670)
                    - Of True Religion (1673)
                    - De Doctrina Christiana (1825, published posthumously, authorship disputed)  
                    """)
                        .markdownTheme(.gitHub)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 10)
                        .background(.white.opacity(0.8))
                        .cornerRadius(8)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
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
