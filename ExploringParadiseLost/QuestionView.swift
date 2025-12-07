//
//  QuestionView.swift
//  ExploringParadiseLost
//
//  Created by 114iosClassStudent04 on 2025/12/2.
//

import SwiftUI

struct QuestionView: View {
    @State private var score = 0
    @State private var total = 0
    @State private var select:[Question] = []
    @State private var gameover = false
    @Environment(\.dismiss) var dismiss
    let LiteratureQuestion: [Question] = [
        Question(text: "In what year was John Milton born?", options: ["1598", "1608", "1618", "1628"], answer: "1608"),
        Question(text: "Which university did Milton attend?", options: ["Oxford University", "Cambridge University", "Edinburgh University", "Trinity College Dublin"], answer: "Cambridge University"),
        Question(text: "What physical affliction affected Milton during the writing of Paradise Lost?", options: ["Deafness", "Blindness", "Paralysis", "Lameness"], answer: "Blindness"),
        Question(text: "By what age was Milton completely blind?", options: ["35", "40", "44", "50"], answer: "44"),
        Question(text: "How did Milton compose Paradise Lost?", options: ["Writing it himself", "Dictation to assistants", "Using a scribe", "Through typewriter"], answer: "Dictation to assistants"),
        Question(text: "In what year was Paradise Lost first published?", options: ["1658", "1665", "1667", "1674"], answer: "1667"),
        Question(text: "Milton served as Latin Secretary under which leader?", options: ["Charles I", "Oliver Cromwell", "Charles II", "James II"], answer: "Oliver Cromwell"),
        Question(text: "What was Milton's political alignment during the English Civil War?", options: ["Royalist", "Parliamentarian", "Neutral", "Moderate"], answer: "Parliamentarian"),
        Question(text: "The first edition of Paradise Lost contained how many books?", options: ["10", "12", "14", "16"], answer: "10"),
        Question(text: "The revised edition of Paradise Lost has how many books?", options: ["10", "12", "14", "16"], answer: "12"),
        Question(text: "Milton's stated purpose in Paradise Lost is to:", options: ["Glorify war", "Justify the ways of God to men", "Condemn humanity", "Praise Satan's rebellion"], answer: "Justify the ways of God to men"),
        Question(text: "Paradise Lost is written in:", options: ["Rhyming couplets", "Blank verse", "Free verse", "Terza rima"], answer: "Blank verse"),
        Question(text: "What meter does Milton use in Paradise Lost?", options: ["Iambic pentameter", "Iambic tetrameter", "Trochaic octameter", "Dactylic hexameter"], answer: "Iambic pentameter"),
        Question(text: "How many times was Milton married?", options: ["Once", "Twice", "Three times", "Never"], answer: "Three times"),
        Question(text: "In what year did Milton die?", options: ["1670", "1672", "1674", "1676"], answer: "1674"),
        Question(text: "Book 1 opens with Satan and the fallen angels:", options: ["In Heaven", "Lying defeated on a burning lake in Hell", "On Earth", "In Chaos"], answer: "Lying defeated on a burning lake in Hell"),
        Question(text: "Satan's first speech in Book 1 is addressed to:", options: ["God", "Beelzebub", "All the fallen angels", "Himself"], answer: "Beelzebub"),
        Question(text: "Satan's famous line 'Better to reign in Hell than serve in Heaven' appears in:", options: ["Book 1", "Book 4", "Book 2", "Book 9"], answer: "Book 1"),
        Question(text: "Who is Satan's second-in-command in Book 1?", options: ["Moloch", "Belial", "Beelzebub", "Mammon"], answer: "Beelzebub"),
        Question(text: "The phrase 'darkness visible' in Book 1 describes:", options: ["Satan's appearance", "The light of Hell", "Eve's sin", " God's wrath"], answer: "The light of Hell"),
        Question(text: "Milton compares the fallen angels lying on the burning lake to:", options: ["Autumn leaves", "Stars", "Flowers", "Rivers"], answer: "Autumn leaves"),
        Question(text: "Pandemonium in Book 1 is:", options: ["A battle strategy", "The palace built by the demons in Hell", "A type of punishment", "Satan's throne"], answer: "The palace built by the demons in Hell"),
        Question(text: "Who is the architect of Pandemonium?", options: ["Beelzebub", "Moloch", "Mammon", "Mulciber/Vulcan"], answer: "Mulciber/Vulcan"),
        Question(text: "The catalogue of demons in Book 1 includes all EXCEPT:", options: ["Moloch", "Belial", "Michael", "Dagon"], answer: "Michael"),
        Question(text: "Satan's shield is compared to:", options: ["The sun", " The moon", "A mountain", "An ocean"], answer: "The moon"),
        Question(text: "Satan's spear is compared to:", options: ["A sword", "A pine tree", "A lightning bolt", "A serpent"], answer: "A pine tree"),
        Question(text: "In Book 1, Satan shows what primary characteristic?", options: ["Despair", "Defiant pride and leadership", "Repentance", "Fear"], answer: "Defiant pride and leadership"),
        Question(text: "The opening invocation of Book 1 calls upon:", options: ["God directly", "The Heavenly Muse", "Christ", "The Holy Spirit"], answer: "The Heavenly Muse"),
        Question(text: "Milton states his argument will surpass:", options: ["Homer and Virgil", "The Bible", "Dante", "Shakespeare"], answer: "Homer and Virgil"),
        Question(text: "The opening words of Paradise Lost are:", options: ["'Sing, Heavenly Muse'", "'Of Man's First Disobedience'", "'In the beginning'", "'Satan, the fallen angel'"], answer: "'Of Man's First Disobedience'"),
        Question(text: "Book 3 opens with Milton's invocation to:", options: [" Satan", "Holy Light", "Adam", "The Son"], answer: "Holy Light"),
        Question(text: "In the divine council of Book 3, God foresees:", options: ["Satan's journey to Earth", "The Fall of Man", "The redemption of humanity", "All of the above"], answer: "All of the above"),
        Question(text: "In Book 3, Milton references his own:", options: ["Childhood", "Marriage", "Blindness", "Political career"], answer: "Blindness"),
        Question(text: "Who volunteers to redeem humanity in Book 3?", options: ["Michael", "Gabriel", "The Son (Christ)", "Raphael"], answer: "The Son (Christ)"),
        Question(text: "God's speech in Book 3 emphasizes humanity's:", options: ["Innocence", "Free will", "Weakness", "Destiny"], answer: "Free will"),
        Question(text: "In Book 3, Satan travels through:", options: ["Heaven", "Chaos", "Purgatory", "Earth's atmosphere"], answer: "Chaos"),
        Question(text: "In Book 3, Satan disguises himself as a:", options: ["Serpent", "Cherub (young angel)", "Toad", "Human"], answer: "Cherub (young angel)"),
        Question(text: "Which angel does Satan deceive in Book 3?", options: [" Gabriel", "Michael", "Uriel", "Raphael"], answer: "Uriel"),
        Question(text: "Uriel is described as the angel of:", options: ["War", "The Sun", "Death", "Wisdom"], answer: "The Sun"),
        Question(text: "Satan's emotions when seeing the Earth in Book 3 include:", options: ["Pure joy", "Conflicted feelings and envy", " Complete despair", "Indifference"], answer: "Conflicted feelings and envy"),
        Question(text: "Book 4 opens with Satan landing on:", options: [" The Tree of Knowledge", "Mount Niphates", "The Garden of Eden directly", "The gates of Paradise"], answer: "Mount Niphates"),
        Question(text: "Satan's soliloquy in Book 4 reveals:", options: ["His complete evil nature", "His internal conflict and despair","His love for God", "His confidence in victory"], answer: "His internal conflict and despair"),
        Question(text: "Satan says 'Which way I fly is Hell; myself am Hell' in:", options: ["Book 1", "Book 4", "Book 2", "Book 9"], answer: "Book 4"),
        Question(text: "In Book 4, Satan enters Paradise by:", options: ["The gate", "Leaping over the wall like a thief", "Flying over", "Tunneling under"], answer: "Leaping over the wall like a thief"),
        Question(text: "In Book 4, Satan first takes the form of what animal in Paradise?", options: ["A serpent", "A lion", "A cormorant", "A wolf"], answer: "A cormorant"),
        Question(text: "In Book 4, Satan sits in the Tree of Life in the form of a cormorant:", options: ["To eat fruit", "To survey Paradise and plan evil", "To rest", "To hide from angels"], answer: "To survey Paradise and plan evil"),
        Question(text: "When Satan first sees Adam and Eve in Book 4, he is:", options: ["Filled with hatred", "Momentarily moved by their beauty", "Afraid", "Indifferent"], answer: "Momentarily moved by their beauty"),
        Question(text: "Adam and Eve's relationship in Book 4 is described as:", options: ["Completely equal", "Hierarchical but loving", "Contentious", "Distant"], answer: "Hierarchical but loving"),
        Question(text: "Adam tells Eve in Book 4 that they must not eat from:", options: ["Any tree", "The Tree of Life", "The Tree of Knowledge of Good and Evil", "The Tree of Wisdom"], answer: "The Tree of Knowledge of Good and Evil"),
        Question(text: "In Book 4, Satan assumes what form to whisper into Eve's ear while she sleeps?", options: ["A serpent", " A toad", "An angel", "A bird"], answer: "A toad"),
        Question(text: "Who discovers Satan whispering to Eve in Book 4?", options: ["Michael", "Uriel and Gabriel", "Ithuriel and Zephon", "Raphael"], answer: "Ithuriel and Zephon"),
        Question(text: "When touched by Ithuriel's spear in Book 4, Satan:", options: ["Remains disguised", "Returns to his own shape", "Disappears", "Attacks the angels"], answer: "Returns to his own shape"),
        Question(text: "Gabriel confronts Satan at the end of Book 4 and:", options: ["Fights him", "Satan flees after God shows a sign in Heaven", "Captures him", "Banishes him to Hell"], answer: "Satan flees after God shows a sign in Heaven"),
        Question(text: "Book 8 primarily consists of:", options: ["Battle scenes", "Adam's conversation with Raphael", "Satan's journey", "The Fall"], answer: "Adam's conversation with Raphael"),
        Question(text: "In Book 8, Adam asks Raphael about:", options: ["The nature of evil", "Astronomy and the cosmos", "Astronomy and the cosmos", "The future"], answer: "Astronomy and the cosmos"),
        Question(text: "In Book 8, Raphael's response to Adam's astronomical questions is:", options: ["A detailed scientific explanation", "That such knowledge is not essential for human happiness", "To study the stars constantly", "That humans cannot understand"], answer: "That such knowledge is not essential for human happiness"),
        Question(text: "Adam describes to Raphael his first memories of:", options: ["Meeting God", "Naming the animals", "Awakening to life", "All of the above"], answer: "All of the above"),
        Question(text: "In Book 8, Adam tells Raphael that Eve was created from:", options: ["Dust like Adam", "His rib while he slept", "Divine light", " Clay"], answer: "His rib while he slept"),
        Question(text: "In Book 8, Adam confesses to Raphael that he feels:", options: ["Superior to Eve", "Overpowered by his passion for Eve", "Indifferent to Eve", "Afraid of Eve"], answer: "Overpowered by his passion for Eve"),
        Question(text: "Raphael warns Adam in Book 8 about:", options: ["Loving Eve too much (uxoriousness)", "Eating forbidden fruit", "Satan's presence", "All of the above"], answer: "Loving Eve too much (uxoriousness)"),
        Question(text: "Book 9 is described by Milton as containing:", options: ["The creation", "The tragic fulfillment of his theme", "The war in Heaven", "The redemption"], answer: "The tragic fulfillment of his theme"),
        Question(text: "At the beginning of Book 9, Satan returns to Paradise after:", options: ["One day", "Seven days circling the Earth", "A month", "A year"], answer: "Seven days circling the Earth"),
        Question(text: "Satan chooses the serpent because it is:", options: ["The strongest animal", "The most subtle creature", "The most beautiful", " The closest to humans"], answer: "The most subtle creature"),
        Question(text: "In Book 9, Eve proposes to Adam that they should:", options: ["Leave Paradise", "Work separately to be more efficient", "Stop working", "Build a shelter"], answer: "Work separately to be more efficient"),
        Question(text: "In Book 9, Adam's response to Eve's proposal to separate is:", options: ["Immediate agreement", "Reluctant consent after she insists", "Absolute refusal", "Indifference"], answer: "Reluctant consent after she insists"),
        Question(text: "In Book 9, Satan finds Eve:", options: ["With Adam", "Alone tending her garden", "Sleeping", "At the Tree of Knowledge"], answer: "Alone tending her garden"),
        Question(text: "In Book 9, the serpent (Satan) first approaches Eve by:", options: ["Speaking immediately", "Flattering her beauty in elaborate speech", "Offering her fruit", "Threatening her"], answer: "Flattering her beauty in elaborate speech"),
        Question(text: "In Book 9, Eve is initially surprised that:", options: ["The serpent is beautiful", "The serpent can speak", "The serpent knows her name", "The serpent is in Paradise"], answer: "The serpent can speak"),
        Question(text: "In Book 9, Satan tells Eve he gained speech by:", options: ["God's gift", "Eating from the Tree of Knowledge", "Magic", " Natural evolution"], answer: "Eating from the Tree of Knowledge"),
        Question(text: "In Book 9, Eve's primary motivation for eating the fruit is:", options: ["Hunger", "Desire for knowledge and to become god-like", " Obedience to the serpent", "Curiosity alone"], answer: "Desire for knowledge and to become god-like"),
        Question(text: "After eating the fruit, Eve's first impulse is to:", options: ["Repent immediately", "Share it with Adam", "Hide from God", "Worship the tree"], answer: "Share it with Adam"),
        Question(text: "In Book 9, Eve decides to give the fruit to Adam because:", options: ["She loves him", "She fears dying and leaving Adam to another Eve", "God commanded it", "The serpent told her to"], answer: "She fears dying and leaving Adam to another Eve"),
        Question(text: "When Eve offers Adam the fruit in Book 9, his first reaction is:", options: ["Joy", "Horror and the loss of the roses from his hand", "Anger", "Confusion"], answer: "Horror and the loss of the roses from his hand"),
        Question(text: "In Book 9, Adam chooses to eat the fruit because:", options: ["He is deceived like Eve", "He is hungry", "He cannot bear to lose Eve and chooses to fall with her", "He wants to become like God"], answer: "He cannot bear to lose Eve and chooses to fall with her"),
        Question(text: "The immediate effects of the Fall in Book 9 include:", options: ["Physical death", "Lust, shame, and discord between Adam and Eve", "Expulsion from Paradise", "Loss of speech"], answer: "Lust, shame, and discord between Adam and Eve"),
        Question(text: "At the beginning of Book 10, the angels report to:", options: ["Satan", "God", "Michael", "Adam"], answer: "God"),
        Question(text: "Who is sent to judge Adam and Eve in Book 10?", options: ["God the Father directly", "The Son", "Michael", "Gabriel"], answer: "The Son"),
        Question(text: "In Book 10, The Son's judgment on the serpent includes:", options: ["Eternal crawling on its belly", "Enmity between it and woman's seed", "Eating dust", "All of the above"], answer: "All of the above"),
        Question(text: "In Book 10, Eve's punishment includes:", options: ["Pain in childbirth", "Subjection to Adam", "None of the above", "All of the above"], answer: "All of the above"),
        Question(text: "In Book 10, Adam's punishment includes:", options: ["Toiling for food from cursed ground", "Mortality", "Painful labor", "All of the above"], answer: "All of the above"),
        Question(text: "Sin and Death, in Book 10:", options: ["Remain in Hell", "Build a bridge from Hell to Earth", "Are destroyed", "Repent"], answer: "Build a bridge from Hell to Earth"),
        Question(text: "When Satan returns to Hell in Book 10, he expects:", options: ["Punishment", "Triumph and applause", "Indifference", "Exile"], answer: "Triumph and applause"),
        Question(text: "Instead of applause, Satan and the demons in Hell are transformed into:", options: ["Toads", "Serpents and offered bitter fruit", "Stones", "Shadows"], answer: "Serpents and offered bitter fruit"),
        Question(text: "In Book 12, Michael shows Adam:", options: ["The past", "Visions of future human history", "Other worlds", "Heaven"], answer: "Visions of future human history"),
        Question(text: "Michael's visions in Book 12 include:", options: ["The story of Noah", "The coming of Christ", "The final judgment", "All of the above"], answer: "All of the above"),
        Question(text: "In Book 12, Adam's response to seeing future human sin and suffering is:", options: ["Despair", "Understanding and acceptance mixed with sorrow", "Anger at God", "Complete joy"], answer: "Understanding and acceptance mixed with sorrow"),
        Question(text: "In Book 12, Michael teaches Adam that salvation comes through:", options: ["Works alone", "Knowledge alone", "Faith in the promised Redeemer", "Remaining in Paradise"], answer: "Faith in the promised Redeemer"),
        Question(text: "At the end of Book 12, Adam and Eve:", options: ["Remain in Paradise", "Are destroyed", "Leave Paradise hand in hand with hope", "Are separated"], answer: "Leave Paradise hand in hand with hope"),
        Question(text: "The final image of Paradise Lost shows:", options: ["Satan's victory", "God's throne", "The flaming sword and cherubim guarding Eden", "Heaven opening"], answer: "The flaming sword and cherubim guarding Eden"),
        Question(text: "In Book 12, Adam's final state of mind includes understanding that:", options: ["All is lost", "Good can come from evil; the 'fortunate fall'", "God is unjust", "Paradise can be regained in this life"], answer: "Good can come from evil; the 'fortunate fall'")
    ]
                        
    var body: some View {
        if select.isEmpty {
            Text("Loading...")
                .font(Font.largeTitle.bold())
                .onAppear{
                    select = Array(LiteratureQuestion.shuffled().prefix(10))
                }
        }else{
            if gameover {
                VStack{
                    ZStack{
                        Image("questionresultbackground")
                            .imageScale(.large)
                            .opacity(0.4)
                        VStack{
                            Image("book")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 100)
                                
                            ZStack{
                                RoundedRectangle(cornerRadius: 26, style: .continuous)
                                    .fill(Color.red)
                                    .frame(width: 300, height: 100)
                                    .opacity(0.8)
                                Text("Game Over !")
                                    .font(Font.largeTitle.bold())
                                    
                            }
                            ZStack{
                                RoundedRectangle(cornerRadius: 26, style: .continuous)
                                    .fill(Color.white)
                                    .frame(width: 300, height: 100)
                                    .opacity(0.8)
                                Text("Total : \(score)")
                                    .font(Font.largeTitle.bold())
                            }
                            ZStack{
                                RoundedRectangle(cornerRadius: 26, style: .continuous)
                                    .fill(Color.yellow)
                                    .shadow(color:.yellow, radius: 10)
                                    .frame(width: 300, height: 75)

                                Group {
                                    if score >= 100 {
                                        Text("✯ Tier: Master of Literature ✯")
                                    } else if score >= 80 {
                                        Text("✯ Tier: Distinguished Scholar ✯")
                                    } else if score >= 60 {
                                        Text("✯ Tier: Accomplished Reader ✯")
                                    } else {
                                        Text("✯ Tier: Beginning Explorer ✯")
                                    }
                                }
                                .bold()
                                .font(.title2)
                                .lineLimit(1)
                                .minimumScaleFactor(0.7)
                                .padding(.horizontal, 12)
                                .frame(width: 300 - 16, height: 75, alignment: .center)
                            }

                            Button("Restart"){
                                score = 0
                                total = 0
                                gameover = false
                                select = Array(LiteratureQuestion.shuffled().prefix(10))
                            }
                            
                            .padding()
                            .frame(width: 100, height: 50)
                            .background(Color.white)
                            .cornerRadius(30)
                        }
                    }
                }
            }
            else{
                ZStack{
                    Image("questionbackground")
                        .resizable()
                        .scaledToFill()
                        .opacity(0.7)
                        .containerRelativeFrame(.horizontal)
                        .ignoresSafeArea()
                        
                   
                    VStack {
                        // Top-left dismiss button row
                        HStack {
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "chevron.left")
                                    .symbolRenderingMode(.monochrome)
                                    .foregroundColor(.black)
                                    .font(.system(size: 28, weight: .bold)) // larger symbol
                                    .frame(width: 56, height: 56) // larger tappable area
                            }
                            Spacer()
                        }
                        .padding(.top, 8)
                        .padding(.leading, 10)
                        .frame(maxWidth: .infinity, alignment: .leading)

                        // Score 區塊靠上
                            ZStack{
                                Capsule()
                                    .fill(Color.white)
                                    .frame(width: 220, height: 100)
                                    .opacity(0.8)
                                Text("Score : \(score)")
                                    .font(Font.largeTitle.bold())
                            }
                            .padding(.top, 24)
                        
                        
                        Spacer(minLength: 10)
                        
                        // 題目區塊：固定高度 + 可捲動，確保能完整閱讀
                        VStack(spacing: 8) {
                            Text("Q.\(total+1)")
                                .font(Font.largeTitle.bold())

                            ScrollView {
                                Text(select[total].text)
                                    .font(.system(size: 28))
                                    .bold()
                                    .multilineTextAlignment(.center)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .padding(.horizontal, 24)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .allowsTightening(true)
                            }
                            .frame(maxWidth: .infinity, minHeight: 160, maxHeight: 260)
                            .padding(.horizontal, 8)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.vertical, 5) 
                        .layoutPriority(1)
                        
                        Spacer(minLength: 4)
                        // 放大選項按鈕 + 增加間距
                        VStack(spacing: 12) {
                            ForEach(select[total].options, id: \.self) { option in
                                Button(action: {
                                    if option == select[total].answer{
                                        score += 10
                                    }
                                    if total < select.count - 1{
                                        total += 1
                                    }else{
                                        gameover = true
                                    }
                                }) {
                                    Text(option)
                                        .font(.title3.bold())
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity)
                                        .frame(width: 280, height: 80) // 調整按鈕尺寸
                                        .contentShape(Rectangle())
                                }
                                .padding(.vertical, 2) // 額外的觸控緩衝
                                .background(Color(red: 183/255, green: 224/255, blue: 237/255, opacity: 0.95))
                                .cornerRadius(22)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 22)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                            }
                        }
                        .padding(.top, 8)
                        .padding(.bottom, 16)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
    }
}


#Preview {
    QuestionView()
}
