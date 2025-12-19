//
//  ContentView.swift
//  Demo5
//
//  Created by 114iosClassStudent04 on 2025/10/17.
//

import SwiftUI

struct CharacterView: View {
    let characters: [Character] = [
            Character(id: "Satan", name: "Satan", quotes: [
                """
                "Better to reign in Hell than serve in Heaven" (Book 1, lines 263)
                """,
                """
                "The mind is its own place, and in itself / Can make a Heav'n of Hell, a Hell of Heav'n" (Book 1, lines 254-255)
                """,
                """
                "Which way I fly is Hell; myself am Hell" (Book 4, line 75)
                """,
                """
                "So farewell hope, and with hope farewell fear, / Farewell remorse: all good to me is lost" (Book 4, lines 108-109)
                """
            ]),
            Character(id: "Adam", name: "Adam", quotes: [
                """
                "For with thee / Certain my resolution is to die; / How can I live without thee" (Book 9, lines 906-908)
                """,
                """
                "But past who can recall, or done undo? / Not God omnipotent, nor Fate" (Book 9, lines 926-927)
                """,
                """
                "O miserable of happy! is this the end / Of this new glorious world, and me so late / The glory of that glory" (Book 10, lines 720-722)
                """,
                """
                "Henceforth I learn that to obey is best" (Book 12, line 561)
                """
            ]),
            Character(id: "Eve", name: "Eve", quotes: [
                """
                "O thou for whom / And from whom I was formed flesh of thy flesh, / And without whom am to no end" (Book 4, lines 440-442)
                """,
                """
                "Let us divide our labors, thou where choice / Leads thee" (Book 9, lines 214-215)
                """,
                """
                "And I perhaps am secret; Heav'n is high, / High and remote to see from thence distinct / Each thing on Earth" (Book 9, lines 811-813)
                """,
                """
                "Both have sinned, but thou / Against God only, I against God and thee" (Book 10, lines 930-931)
                """
            ]),
            Character(id: "The Son", name: "The Son", quotes: [
                """
                "Behold me then, me for him, life for life / I offer, on me let thine anger fall"
                """,
                """
                "Account me Man; I for his sake will leave / Thy bosom, and this glory next to thee / Freely put off" (Book 3, lines 238-240)
                """,
                """
                "Whom send I to judge them? Whom but thee / Vicegerent Son, to thee I have transferred / All judgment" (Book 10, lines 55-57)
                """,
                """
                "The rigid satisfaction, death for death" (Book 3, line 212)
                """
            ]),
            Character(id: "God", name: "God", quotes: [
                """
                "Man shall not quite be lost, but saved who will, / Yet not of will in him, but grace in me" (Book 3, lines 173-174)
                """,
                """
                "I formed them free, and free they must remain, / Till they enthrall themselves" (Book 3, lines 124-125)
                """,
                """
                "Sufficient to have stood, though free to fall" (Book 3, line 99)
                """,
                """
                "They themselves decreed / Their own revolt, not I: if I foreknew, / Foreknowledge had no influence on their fault" (Book 3, lines 116-118)
                """
            ]),
            Character(id: "Gabriel", name: "Gabriel", quotes: [
                """
                "And thou sly hypocrite, who now wouldst seem / Patron of liberty, who more than thou / Once fawned, and cringed, and servilely adored / Heav'n's awful Monarch?" (Book 4, lines 957-960)
                """,
                """
                "Faithful found / Among the faithless" (Book 5, lines 896-897)
                """
            ]),
            Character(id: "Raphael", name: "Raphael", quotes: [
                """
                "God is thy law, thou mine: to know no more / Is woman's happiest knowledge and her praise" (Book 4, lines 637-638)
                """,
                """
                "Be strong, live happy, and love, but first of all / Him whom to love is to obey" (Book 8, lines 633-634)
                """,
                """
                "In loving thou dost well, in passion not, / Wherein true Love consists not" (Book 8, lines 588-589)
                """
            ]),
            Character(id: "Michael", name: "Michael", quotes: [
                """
                "This having learned, thou hast attained the sum / Of wisdom; hope no higher" (Book 12, lines 575-576)
                """,
                """
                "Nor love thy life, nor hate; but what thou liv'st / Live well, how long or short permit to Heav'n" (Book 11, lines 553-554)
                """,
                """
                "Add deeds to thy knowledge answerable, add faith, / Add virtue, patience, temperance, add love" (Book 12, lines 581-583)
                """
            ])
        ]
    @State private var showAlert = false
    @State private var currentQuote = ""
    @State private var currentCharacterName = ""
    
    private func presentQuote(for character: Character) {
            if let randomQuote = character.quotes.randomElement() {
                currentQuote = randomQuote
                currentCharacterName = character.name
                showAlert = true
            }
        }
    var body: some View {
        TabView{
            ZStack{   // 撒旦介紹
                    RoundedRectangle(cornerRadius: 26, style: .continuous)
                        .fill(Color(red: 148/255, green: 16/255, blue: 16/255))
                        .opacity(0.3)
                VStack(spacing: 12) {
                    VStack{
                        Image("Satan")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .onTapGesture {   // Quote
                                if let satan = characters.first(where: { $0.id == "Satan" }) {
                                    presentQuote(for: satan)
                                }
                            }
                    }
                    Text("✯✯ Satan ✯✯")
                        .font(.largeTitle)
                        .bold()
                    Text("The fallen archangel who rebels against God")
                        .foregroundStyle(Color.gray)
                    ScrollView(.vertical, showsIndicators: false) {
                        Text("""
                             📌Character Overview\n
                                  Satan is perhaps the most 
                                  complex and controversial 
                                  character in Paradise Lost. 
                                  Once named Lucifer, he was the 
                                  most beautiful and powerful of 
                                  God's angels before his fall. 
                                  Driven by pride and envy of the 
                                  Son's exaltation, Satan leads a 
                                  rebellion against God in Heaven, 
                                  resulting in a three-day war that 
                                  ends with his defeat and expulsion 
                                  to Hell.\n
                            📌Key Characteristics\n
                               ∙Pride and Ambition
                                 Satan's defining trait is his 
                                 refusal to accept subordination 
                                 to anyone, even God. His famous 
                                 declaration, "Better to reign in Hell 
                                 than serve in Heaven" (Book 1), 
                                 encapsulates his prideful nature.\n
                              ∙Rhetorical Brilliance
                                Satan is a masterful speaker who 
                                can inspire his fallen legions and 
                                deceive others with persuasive
                                language.\n
                              ∙Internal Conflict
                                Despite his defiance, Satan 
                                experiences moments of doubt, 
                                regret, and despair, particularly in 
                                his soliloquies in Book 4, where he 
                                admits "myself am Hell."\n          
                              ∙Degradation
                                Throughout the epic, Satan 
                                progressively degenerates from a 
                                majestic fallen angel to a serpent, 
                                symbolizing his moral decay.\n
                              ∙Determination
                                Satan shows relentless persistence 
                                in his quest to corrupt God's new 
                                creation (humanity) as revenge for 
                                his fall.\n
                            📕Major Appearances\n
                            ∙Book 1
                               Rallies the fallen angels in Hell, 
                               delivers inspiring speeches\n
                            ∙Book 2
                               Volunteers to journey to Earth alone\n
                            ∙Book 3
                               Travels through Chaos, deceives 
                               Uriel\n
                            ∙Book 4
                               Experiences internal torment on 
                               Mount Niphates, enters Paradise, 
                               discovered by Gabriel's angels\n
                            ∙Book 9
                               Possesses the serpent and 
                               tempts Eve\n
                            ∙Book 10
                               Returns to Hell expecting glory but 
                               is transformed into a serpent\n
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

            ZStack {   // 亞當介紹
                RoundedRectangle(cornerRadius: 26, style: .continuous)
                    .fill(Color(red: 82/255, green: 123/255, blue: 227/255))
                    .opacity(0.3)

                // Make the content hug the top
                VStack(spacing: 12) {
                    VStack{
                        Image("Adam")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .onTapGesture {   // Quote
                                if let adam = characters.first(where: { $0.id == "Adam" }) {
                                    presentQuote(for: adam)
                                }
                            }
                    }
                    Text("✯✯ Adam ✯✯")
                        .font(.largeTitle)
                        .bold()
                    Text("The first human man")
                        .foregroundStyle(.gray)
                    ScrollView(.vertical, showsIndicators: false) {
                        Text("""
                            📌Character Overview\n
                                  Adam is created directly by God as 
                                  the first human being and placed 
                                  in Paradise as its keeper. He is 
                                  given dominion over all creatures 
                                  and is endowed with reason, free 
                                  will, and the ability to 
                                  communicate directly with God 
                                  and angels. Adam represents 
                                  humanity's original innocence and 
                                  the tragic consequences of 
                                  disobedience.\n
                            📌Key Characteristics\n
                                ∙Reason and Intelligence
                                   Adam is highly rational and 
                                   curious, engaging in deep 
                                   philosophical conversations with 
                                   Raphael about astronomy, 
                                   creation, and divine matters.\n
                                ∙Authority and Responsibility
                                   As the first man, Adam has 
                                   authority over Eve and 
                                   all creation, but also bears the 
                                   responsibility for maintaining 
                                   obedience to God.\n
                                ∙Love for Eve
                                   Adam's excessive love for Eve 
                                   (uxoriousness) becomes his tragic 
                                   flaw. He chooses to fall with her 
                                   rather than remain obedient 
                                   to God and lose her.\n
                                ∙Conscience and Remorse
                                   After the Fall, Adam experiences 
                                   profound guilt, shame, and 
                                   despair, initially blaming Eve 
                                   before moving toward repentance.\n
                                ∙Growth and Learning
                                   Through Michael's instruction in 
                                   Book 12, Adam gains knowing
                                   of history, redemption, and the 
                                   "fortunate fall."\n
                            📕Major Appearances\n
                            ∙Book 4
                               Lives in harmony with Eve in 
                               Paradise; explains the 
                               forbidden tree\n
                            ∙Book 5-8
                               Receives Raphael's warnings and 
                               teachings; describes his creation 
                               and Eve's formation\n
                            ∙Book 9
                               Reluctantly allows Eve to work 
                               separately; chooses to eat the 
                               forbidden fruit to die with Eve\n
                            ∙Book 10
                               Experiences judgment, despair, and 
                               begins reconciliation with Eve\n
                            ∙Book 11-12
                               Receives visions and prophecies 
                               from Michael; learns of 
                               future redemption\n
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
                    .fill(Color(red: 235/255, green: 68/255, blue: 126/255))
                    .opacity(0.3)
                
                VStack(spacing: 12) {
                    VStack{
                        Image("Eve")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .onTapGesture {   // Quote
                                if let eve = characters.first(where: { $0.id == "Eve" }) {
                                    presentQuote(for: eve)
                                }
                            }
                    }
                    Text("✯✯ Eve ✯✯")
                        .font(.largeTitle)
                        .bold()
                    
                    Text("The first human woman")
                        .foregroundStyle(.gray)
                    ScrollView(.vertical, showsIndicators: false) {
                        Text("""
                            📌Character Overview\n
                                  Eve is created from Adam's rib to 
                                  be his companion and help-meet. 
                                  She is described as beautiful, 
                                  graceful, and initially innocent, but 
                                  also more susceptible to 
                                  temptation than Adam. Her fall 
                                  triggers humanity's loss of 
                                  Paradise, making her one of 
                                  literature's most significant and 
                                  controversial female characters.\n
                            📌Key Characteristics\n
                                ∙Beauty and Grace
                                   Eve is portrayed as supremely 
                                   beautiful, the ideal of feminine 
                                   beauty, which becomes both her 
                                   glory and a source of vanity.\n
                                ∙Narcissism
                                   Her first memory is of seeing her 
                                   reflection in a pool and becoming 
                                   captivated by her own image, 
                                   suggesting an inclination toward 
                                   self-love.\n
                                ∙Independence
                                   Eve desires to work separately 
                                   from Adam in Book 9, showing 
                                   autonomy but also making herself 
                                   vulnerable to Satan's temptation.\n
                                ∙Intellectual Curiosity
                                   Eve is attracted to the promise of 
                                   knowledge and godlike wisdom, 
                                   making her susceptible to 
                                   Satan's arguments.\n
                                ∙Rationalization
                                   After eating the fruit, Eve 
                                   convinces herself to share it with 
                                   Adam, fearing she might die and 
                                   Adam would be given another Eve.\n
                                ∙Capacity for Repentance
                                   Despite causing the Fall, Eve is 
                                   the first to suggest repentance to 
                                   Adam in Book 10.\n
                            📕Major Appearances\n
                            ∙Book 4
                               Lives in Paradise with Adam in 
                               hierarchical but loving relationship\n
                            ∙Book 5
                               Has a troubling dream planted 
                               by Satan\n
                            ∙Book 8
                               Her creation from Adam's rib 
                               is described\n
                            ∙Book 9
                               Works separately from Adam; is 
                               tempted by Satan in serpent form; 
                               eats the forbidden fruit; persuades 
                               Adam to eat\n
                            ∙Book 10
                               Receives judgment; reconciles with 
                               Adam; proposes repentance\n
                            ∙Book 12
                               Leaves Paradise with Adam, looking 
                               forward with hope\n
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
                    .fill(Color(red: 240/255, green: 236/255, blue: 19/255))
                    .opacity(0.3)
                
                VStack(spacing: 12) {
                    VStack{
                        Image("The Son")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .onTapGesture {   // Quote
                                if let theson = characters.first(where: { $0.id == "The Son" }) {
                                    presentQuote(for: theson)
                                }
                            }
                    }
                    
                    Text("✯✯ The Son ✯✯")
                        .font(.largeTitle)
                        .bold()
                    
                    Text("Humanity's future redeemer and judge")
                        .foregroundStyle(.gray)
                    ScrollView(.vertical, showsIndicators: false) {
                        Text("""
                            📌Character Overview\n
                                  The Son is portrayed as both equal 
                                  to God the Father in divinity and 
                                  subordinate in function. He serves 
                                  as the instrument of creation, the 
                                  warrior who defeats Satan in the 
                                  War in Heaven, the volunteer 
                                  redeemer of humanity, and the 
                                  merciful judge who pronounces 
                                  sentence after the Fall.\n
                            📌Key Characteristics\n
                                ∙Divine Love and Mercy
                                   The Son embodies God's mercy 
                                   and love, volunteering to die for 
                                   humanity's redemption.\n
                                ∙Obedience
                                   Unlike Satan, the Son perfectly 
                                   obeys the Father, demonstrating 
                                   the virtue of willing submission.\n
                                ∙Creative Power
                                   In Book 7, the Son is revealed as 
                                   the agent through whom God 
                                   creates the universe.\n
                                ∙Military Might
                                   The Son single-handedly defeats 
                                   Satan and his rebel angels in Book 
                                   6, driving them from Heaven in 
                                   his chariot.\n
                                ∙Justice and Compassion
                                   As judge in Book 10, the Son 
                                   pronounces God's sentence but 
                                   also provides clothes for Adam 
                                   and Eve, showing mercy.\n
                            📕Major Appearances\n
                            ∙Book 3
                               Volunteers to become incarnate and 
                               die to redeem humanity\n
                            ∙Book 5-6
                               Exalted by God, which triggers 
                               Satan's rebellion; defeats Satan in 
                               the War in Heaven\n
                            ∙Book 7
                               Creates the universe at 
                               God's command\n
                            ∙Book 10
                               Descends to judge Adam, Eve, and 
                               the serpent; shows mercy in 
                               his judgment\n
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
                    .fill(Color(red: 240/255, green: 236/255, blue: 19/255))
                    .opacity(0.3)
                
                VStack(spacing: 12) {
                    VStack{
                        Image("God")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .onTapGesture {   // Quote
                                if let god = characters.first(where: { $0.id == "God" }) {
                                    presentQuote(for: god)
                                }
                            }
                    }
                    
                    Text("✯✯ God ✯✯")
                        .font(.largeTitle)
                        .bold()
                    
                    Text("The supreme ruler of the universe")
                        .foregroundStyle(.gray)
                    ScrollView(.vertical, showsIndicators: false) {
                        Text("""
                            📌Character Overview\n
                                  God the Father is the ultimate 
                                  authority in Paradise Lost, though 
                                  Milton faces the difficult challenge 
                                  of making the Almighty 
                                  dramatically interesting. God is 
                                  portrayed as just, omniscient, and 
                                  omnipotent, but his speeches 
                                  explaining his justice can seem 
                                  defensive or overly rational to 
                                  some readers.\n
                            📌Key Characteristics\n
                                ∙Omniscience
                                   God knows all events past, 
                                   present, and future, including 
                                   humanity's fall before it happens.\n
                                ∙Justice
                                   God insists on strict justice, 
                                   demanding that the penalty for sin 
                                   (death) must be paid.\n
                                ∙Free Will
                                   God emphasizes that he created 
                                   angels and humans with genuine 
                                   free will, making them responsible 
                                   for their choices.\n
                                ∙Sovereignty
                                   God's authority is absolute and 
                                   cannot be successfully 
                                   challenged.\n
                                ∙Love Through the Son
                                   While the Father often appears 
                                   stern, his love is manifested 
                                   through the Son.\n
                            📕Major Appearances\n
                            ∙Book 3
                               Sits in Heaven with the Son, 
                               foresees the Fall, accepts the Son's 
                               offer to redeem humanity\n
                            ∙Book 5-6
                               Exalts the Son, triggering Satan's 
                               rebellion; sends the Son to defeat 
                               the rebels\n
                            ∙Book 7
                               Commands the Son to create 
                               the universe\n
                            ∙Book 10
                               Sends the Son to judge humanity; 
                               accepts Adam and Eve's repentance 
                               through the Son's intercession\n
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
                    .fill(Color(red: 245/255, green: 206/255, blue: 34/255))
                    .opacity(0.3)
                
                VStack(spacing: 12) {
                    VStack{
                        Image("Gabriel")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .onTapGesture {   // Quote
                                if let gabriel = characters.first(where: { $0.id == "Gabriel" }) {
                                    presentQuote(for: gabriel)
                                }
                            }
                    }
                    
                    Text("✯✯ Gabriel ✯✯")
                        .font(.largeTitle)
                        .bold()
                    
                    Text("Chief of the angelic guards")
                        .foregroundStyle(.gray)
                    ScrollView(.vertical, showsIndicators: false) {
                        Text("""
                            📌Character Overview\n
                                  Gabriel is one of the four 
                                  archangels and serves as the 
                                  leader of Heaven's warrior angels. 
                                  He is specifically assigned to 
                                  guard Paradise and prevent Satan 
                                  from corrupting Adam and Eve. 
                                  Gabriel represents divine authority 
                                  and military readiness in defense 
                                  of God's creation.\n
                            📌Key Characteristics\n
                                ∙Vigilance
                                   He organizes patrols and security 
                                   measures around Eden.\n
                                ∙Martial Prowess
                                   Gabriel is prepared for combat 
                                   and confronts Satan directly.\n
                            📕Major Appearances\n
                            ∙Book 4
                               Confronts Satan when he is 
                               discovered in Paradise; nearly fights 
                               Satan but God intervenes with a 
                               sign in Heaven causing Satan to flee\n
                            ∙Book 6
                               Participates in the War in Heaven 
                               against Satan's forces\n
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
                    .fill(Color(red: 245/255, green: 206/255, blue: 34/255))
                    .opacity(0.3)
                
                VStack(spacing: 12) {
                    VStack{
                        Image("Raphael")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .onTapGesture {   // Quote
                                if let raphael = characters.first(where: { $0.id == "Raphael" }) {
                                    presentQuote(for: raphael)
                                }
                            }
                    }
                    
                    Text("✯✯ Raphael ✯✯")
                        .font(.largeTitle)
                        .bold()
                    
                    Text("Heaven's messenger and teacher to Adam")
                        .foregroundStyle(.gray)
                    ScrollView(.vertical, showsIndicators: false) {
                        Text("""
                            📌Character Overview\n
                                  Raphael is sent by God to Paradise 
                                  to warn Adam about Satan's 
                                  presence and to instruct him in 
                                  obedience. He is the most 
                                  developed angelic character after 
                                  the major protagonists, serving as 
                                  a bridge between Heaven and 
                                  humanity. His extended 
                                  conversations with Adam occupy 
                                  much of Books 5-8.\n
                            📌Key Characteristics\n
                                ∙Teacher and Mentor
                                   Raphael's primary role is to 
                                   educate Adam about cosmic 
                                   history, free will, and 
                                   proper obedience.\n
                                ∙Storyteller
                                   He narrates the War in Heaven, 
                                   the creation of the world, and the 
                                   nature of angelic existence.\n
                            📕Major Appearances\n
                            ∙Book 5
                               Arrives in Paradise, dines with Adam 
                               and Eve, begins his instruction\n
                            ∙Book 6
                               Describes the War in Heaven and 
                               Satan's defeat\n
                            ∙Book 7
                               Explains the creation of the universe\n
                            ∙Book 8
                               Discusses astronomy, hears Adam's 
                               account of his creation and Eve's 
                               formation, warns against 
                               uxoriousness (excessive love for 
                               Eve), departs\n
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
                    .fill(Color(red: 245/255, green: 206/255, blue: 34/255))
                    .opacity(0.3)
                
                VStack(spacing: 12) {
                    VStack{
                        Image("Michael")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .onTapGesture {   // Quote
                                if let michael = characters.first(where: { $0.id == "Michael" }) {
                                    presentQuote(for: michael)
                                }
                            }
                    }
                    
                    Text("✯✯ Michael ✯✯")
                        .font(.largeTitle)
                        .bold()
                    
                    Text("The greatest warrior angel")
                        .foregroundStyle(.gray)
                    ScrollView(.vertical, showsIndicators: false) {
                        Text("""
                            📌Character Overview\n
                                  Michael is the chief of all angels, 
                                  the supreme military commander 
                                  of Heaven's forces, and the angel 
                                  who ultimately expels Adam and 
                                  Eve from Paradise. He is more 
                                  stern and authoritative than 
                                  Raphael, representing divine 
                                  justice and the consequences of 
                                  sin, but also mercy through his 
                                  prophecies of redemption.\n
                            📌Key Characteristics\n
                                ∙Authority
                                   He carries out God's most serious 
                                   commands, including the 
                                   expulsion from Paradise.\n
                                ∙Prophet and Teacher
                                   Michael shows Adam visions of 
                                   future human history from Cain 
                                   and Abel to the Last Judgment.\n
                            📕Major Appearances\n
                            ∙Book 6
                               Leads Heaven's angels in battle, 
                               personally wounds Satan in single 
                               combat before the Son's 
                               final victory\n
                            ∙Book 11
                               Arrives to expel Adam and Eve from 
                               Paradise; shows Adam visions of 
                               future human sin and suffering\n
                            ∙Book 12
                               Continues prophetic instruction, 
                               revealing Christ's coming and 
                               redemption; leads Adam and Eve 
                               out of Paradise\n
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
        .alert("\(currentCharacterName) ", isPresented: $showAlert) {
                    Button("Got it!") {}
                } message: {
                    Text(currentQuote)
                        
                }
        .background{
            Image("CharacterBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(0.4)
        }
    }
}

#Preview {
    CharacterView()
}
