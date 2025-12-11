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
    let summary: String
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
            title: "Book I",
            originalText: """
            **Of Man's first** disobedience, and the fruit  
            Of that forbidden tree whose mortal taste  
            Brought death into the World, and all our woe,  
            With loss of Eden, till one greater Man  
            Restore us, and regain the blissful seat,  
            Sing, Heavenly Muse, that, on the secret top  
            Of Oreb, or of Sinai, didst inspire  
            That shepherd who first taught the chosen seed  
            In the beginning how the heavens and earth  
            Rose out of Chaos: or, if Sion hill  
            Delight thee more, and Siloa’s brook that flowed  
            Fast by the oracle of God, I thence  
            Invoke thy aid to my adventurous song,  
            That with no middle flight intends to soar  
            Above th’ Aonian mount, while it pursues  
            Things unattempted yet in prose or rhyme.  
            And chiefly thou, O Spirit, that dost prefer  
            Before all temples th’ upright heart and pure,  
            Instruct me, for thou know’st; thou from the first  
            Wast present,and, with mighty wings outspread,  
            Dove-like sat’st brooding on the vast Abyss,  
            And mad’st it pregnant: what in me is dark  
            Illumine, what is low raise and support;  
            That, to the height of this great argument,  
            I may assert Eternal Providence,  
            And justify the ways of God to men.  
            **Say first—for** Heaven hides nothing from thy view,  
            Nor the deep tract of Hell—say first what cause  
            Moved our grand parents, in that happy state,  
            Favoured of Heaven so highly, to fall off  
            From their Creator, and transgress his will  
            For one restraint, lords of the World besides.  
            Who first seduced them to that foul revolt?  
            **Th’ infernal Serpent**; he it was whose guile,  
            Stirred up with envy and revenge, deceived  
            The mother of mankind, what time his pride  
            Had cast him out from Heaven, with all his host  
            Of rebel Angels, by whose aid, aspiring  
            To set himself in glory above his peers,  
            He trusted to have equalled the Most High,  
            If he opposed, and with ambitious aim  
            Against the throne and monarchy of God,  
            Raised impious war in Heaven and battle proud,  
            With vain attempt. Him the Almighty Power  
            Hurled headlong flaming from th’ ethereal sky,  
            With hideous ruin and combustion, down  
            To bottomless perdition, there to dwell  
            In adamantine chains and penal fire,  
            Who durst defy th’ Omnipotent to arms.  
            **Nine times the** space that measures day and night  
            To mortal men, he, with his horrid crew,  
            Lay vanquished, rolling in the fiery gulf,  
            Confounded, though immortal. But his doom  
            Reserved him to more wrath; for now the thought  
            Both of lost happiness and lasting pain  
            Torments him: round he throws his baleful eyes,  
            That witnessed huge affliction and dismay,  
            Mixed with obdurate pride and steadfast hate.  
            At once, as far as Angels ken, he views  
            The dismal situation waste and wild.  
            A dungeon horrible, on all sides round,  
            As one great furnace flamed; yet from those flames  
            No light; but rather darkness visible  
            Served only to discover sights of woe,  
            Regions of sorrow, doleful shades, where peace  
            And rest can never dwell, hope never comes  
            That comes to all, but torture without end  
            Still urges, and a fiery deluge, fed  
            With ever-burning sulphur unconsumed.  
            Such place Eternal Justice has prepared  
            For those rebellious; here their prison ordained  
            In utter darkness, and their portion set,  
            As far removed from God and light of Heaven  
            As from the centre thrice to th’ utmost pole.  
            Oh how unlike the place from whence they fell!  
            There the companions of his fall, o’erwhelmed  
            With floods and whirlwinds of tempestuous fire,  
            He soon discerns; and, weltering by his side,  
            One next himself in power, and next in crime,  
            Long after known in Palestine, and named  
            Beelzebub. To whom th’ Arch-Enemy,  
            And thence in Heaven called Satan, with bold words  
            Breaking the horrid silence, thus began:—  
            “**If thou beest** he—but O how fallen! how changed  
            From him who, in the happy realms of light  
            Clothed with transcendent brightness, didst outshine  
            Myriads, though bright!—if he whom mutual league,  
            United thoughts and counsels, equal hope  
            And hazard in the glorious enterprise  
            Joined with me once, now misery hath joined  
            In equal ruin; into what pit thou seest  
            From what height fallen: so much the stronger proved  
            He with his thunder; and till then who knew  
            The force of those dire arms? Yet not for those,  
            Nor what the potent Victor in his rage  
            Can else inflict, do I repent, or change,  
            Though changed in outward lustre, that fixed mind,  
            And high disdain from sense of injured merit,  
            That with the Mightiest raised me to contend,  
            And to the fierce contentions brought along  
            Innumerable force of Spirits armed,  
            That durst dislike his reign, and, me preferring,  
            His utmost power with adverse power opposed  
            In dubious battle on the plains of Heaven,  
            And shook his throne. What though the field be lost?  
            All is not lost—the unconquerable will,  
            And study of revenge, immortal hate,  
            And courage never to submit or yield:  
            And what is else not to be overcome?  
            That glory never shall his wrath or might  
            Extort from me. To bow and sue for grace  
            With suppliant knee, and deify his power  
            Who, from the terror of this arm, so late  
            Doubted his empire—that were low indeed;  
            That were an ignominy and shame beneath  
            This downfall; since, by fate, the strength of Gods,  
            And this empyreal substance, cannot fail;  
            Since, through experience of this great event,  
            In arms not worse, in foresight much advanced,  
            We may with more successful hope resolve  
            To wage by force or guile eternal war,  
            Irreconcilable to our grand Foe,  
            Who now triumphs, and in th’ excess of joy  
            Sole reigning holds the tyranny of Heaven.”  
            **So spake th’** apostate Angel, though in pain,  
            Vaunting aloud, but racked with deep despair;  
            And him thus answered soon his bold compeer:—  
             “**O Prince**, O Chief of many throned Powers  
            That led th’ embattled Seraphim to war  
            Under thy conduct, and, in dreadful deeds  
            Fearless, endangered Heaven’s perpetual King,  
            And put to proof his high supremacy,  
            Whether upheld by strength, or chance, or fate,  
            Too well I see and rue the dire event  
            That, with sad overthrow and foul defeat,  
            Hath lost us Heaven, and all this mighty host  
            In horrible destruction laid thus low,  
            As far as Gods and heavenly Essences  
            Can perish: for the mind and spirit remains  
            Invincible, and vigour soon returns,  
            Though all our glory extinct, and happy state  
            Here swallowed up in endless misery.  
            But what if he our Conqueror (whom I now  
            Of force believe almighty, since no less  
            Than such could have o’erpowered such force as ours)  
            Have left us this our spirit and strength entire,  
            Strongly to suffer and support our pains,  
            That we may so suffice his vengeful ire,  
            Or do him mightier service as his thralls  
            By right of war, whate’er his business be,  
            Here in the heart of Hell to work in fire,  
            Or do his errands in the gloomy Deep?  
            What can it then avail though yet we feel  
            Strength undiminished, or eternal being  
            To undergo eternal punishment?”  
            **Whereto with speedy** words th’ Arch-Fiend replied:—  
            “Fallen Cherub, to be weak is miserable,  
            Doing or suffering: but of this be sure—  
            To do aught good never will be our task,  
            But ever to do ill our sole delight,  
            As being the contrary to his high will  
            Whom we resist. If then his providence  
            Out of our evil seek to bring forth good,  
            Our labour must be to pervert that end,  
            And out of good still to find means of evil;  
            Which ofttimes may succeed so as perhaps  
            Shall grieve him, if I fail not, and disturb  
            His inmost counsels from their destined aim.  
            But see! the angry Victor hath recalled  
            His ministers of vengeance and pursuit  
            Back to the gates of Heaven: the sulphurous hail,  
            Shot after us in storm, o’erblown hath laid  
            The fiery surge that from the precipice  
            Of Heaven received us falling; and the thunder,  
            Winged with red lightning and impetuous rage,  
            Perhaps hath spent his shafts, and ceases now  
            To bellow through the vast and boundless Deep.  
            Let us not slip th’ occasion, whether scorn  
            Or satiate fury yield it from our Foe.  
            Seest thou yon dreary plain, forlorn and wild,  
            The seat of desolation, void of light,  
            Save what the glimmering of these livid flames  
            Casts pale and dreadful? Thither let us tend  
            From off the tossing of these fiery waves;  
            There rest, if any rest can harbour there;  
            And, re-assembling our afflicted powers,  
            Consult how we may henceforth most offend  
            Our enemy, our own loss how repair,  
            How overcome this dire calamity,  
            What reinforcement we may gain from hope,  
            If not, what resolution from despair.”  
            **Thus Satan**, talking to his nearest mate,  
            With head uplift above the wave, and eyes  
            That sparkling blazed; his other parts besides  
            Prone on the flood, extended long and large,  
            Lay floating many a rood, in bulk as huge  
            As whom the fables name of monstrous size,  
            Titanian or Earth-born, that warred on Jove,  
            Briareos or Typhon, whom the den  
            By ancient Tarsus held, or that sea-beast  
            Leviathan, which God of all his works  
            Created hugest that swim th’ ocean-stream.  
            Him, haply slumbering on the Norway foam,  
            The pilot of some small night-foundered skiff,  
            Deeming some island, oft, as seamen tell,  
            With fixed anchor in his scaly rind,  
            Moors by his side under the lee, while night  
            Invests the sea, and wished morn delays.  
            So stretched out huge in length the Arch-fiend lay,  
            Chained on the burning lake; nor ever thence  
            Had risen, or heaved his head, but that the will  
            And high permission of all-ruling Heaven  
            Left him at large to his own dark designs,  
            That with reiterated crimes he might  
            Heap on himself damnation, while he sought  
            Evil to others, and enraged might see  
            How all his malice served but to bring forth  
            Infinite goodness, grace, and mercy, shewn  
            On Man by him seduced, but on himself  
            Treble confusion, wrath, and vengeance poured.  
            **Forthwith upright** he rears from off the pool  
            His mighty stature; on each hand the flames  
            Driven backward slope their pointing spires, and rolled  
            In billows, leave i’ th’ midst a horrid vale.  
            Then with expanded wings he steers his flight  
            Aloft, incumbent on the dusky air,  
            That felt unusual weight; till on dry land  
            He lights—if it were land that ever burned  
            With solid, as the lake with liquid fire,  
            And such appeared in hue as when the force  
            Of subterranean wind transports a hill  
            Torn from Pelorus, or the shattered side  
            Of thundering Etna, whose combustible  
            And fuelled entrails, thence conceiving fire,  
            Sublimed with mineral fury, aid the winds,  
            And leave a singed bottom all involved  
            With stench and smoke. Such resting found the sole  
            Of unblest feet. Him followed his next mate;  
            Both glorying to have scaped the Stygian flood  
            As gods, and by their own recovered strength,  
            Not by the sufferance of supernal Power.  
             “**Is this the** region, this the soil, the clime,”  
            Said then the lost Archangel, “this the seat  
            That we must change for Heaven?—this mournful gloom  
            For that celestial light? Be it so, since he  
            Who now is sovereign can dispose and bid  
            What shall be right: farthest from him is best  
            Whom reason hath equalled, force hath made supreme  
            Above his equals. Farewell, happy fields,  
            Where joy for ever dwells! Hail, horrors! hail,  
            Infernal world! and thou, profoundest Hell,  
            Receive thy new possessor—one who brings  
            A mind not to be changed by place or time.  
            The mind is its own place, and in itself  
            Can make a Heaven of Hell, a Hell of Heaven.  
            What matter where, if I be still the same,  
            And what I should be, all but less than he  
            Whom thunder hath made greater? Here at least  
            We shall be free; th’ Almighty hath not built  
            Here for his envy, will not drive us hence:  
            Here we may reign secure; and, in my choice,  
            To reign is worth ambition, though in Hell:  
            Better to reign in Hell than serve in Heaven.  
            But wherefore let we then our faithful friends,  
            Th’ associates and co-partners of our loss,  
            Lie thus astonished on th’ oblivious pool,  
            And call them not to share with us their part  
            In this unhappy mansion, or once more  
            With rallied arms to try what may be yet  
            Regained in Heaven, or what more lost in Hell?”  
            **So Satan spake**; and him Beelzebub  
            Thus answered:—“Leader of those armies bright  
            Which, but th’ Omnipotent, none could have foiled!  
            If once they hear that voice, their liveliest pledge  
            Of hope in fears and dangers—heard so oft  
            In worst extremes, and on the perilous edge  
            Of battle, when it raged, in all assaults  
            Their surest signal—they will soon resume  
            New courage and revive, though now they lie  
            Grovelling and prostrate on yon lake of fire,  
            As we erewhile, astounded and amazed;  
            No wonder, fallen such a pernicious height!”  
            **He scarce had** ceased when the superior Fiend  
            Was moving toward the shore; his ponderous shield,  
            Ethereal temper, massy, large, and round,  
            Behind him cast. The broad circumference  
            Hung on his shoulders like the moon, whose orb  
            Through optic glass the Tuscan artist views  
            At evening, from the top of Fesole,  
            Or in Valdarno, to descry new lands,  
            Rivers, or mountains, in her spotty globe.  
            His spear—to equal which the tallest pine  
            Hewn on Norwegian hills, to be the mast  
            Of some great ammiral, were but a wand—  
            He walked with, to support uneasy steps  
            Over the burning marl, not like those steps  
            On Heaven’s azure; and the torrid clime  
            Smote on him sore besides, vaulted with fire.  
            Nathless he so endured, till on the beach  
            Of that inflamed sea he stood, and called  
            His legions—Angel Forms, who lay entranced  
            Thick as autumnal leaves that strow the brooks  
            In Vallombrosa, where th’ Etrurian shades  
            High over-arched embower; or scattered sedge  
            Afloat, when with fierce winds Orion armed  
            Hath vexed the Red-Sea coast, whose waves o’erthrew  
            Busiris and his Memphian chivalry,  
            While with perfidious hatred they pursued  
            The sojourners of Goshen, who beheld  
            From the safe shore their floating carcases  
            And broken chariot-wheels. So thick bestrown,  
            Abject and lost, lay these, covering the flood,  
            Under amazement of their hideous change.  
            He called so loud that all the hollow deep  
            Of Hell resounded:—“Princes, Potentates,  
            Warriors, the Flower of Heaven—once yours; now lost,  
            If such astonishment as this can seize  
            Eternal Spirits! Or have ye chosen this place  
            After the toil of battle to repose  
            Your wearied virtue, for the ease you find  
            To slumber here, as in the vales of Heaven?  
            Or in this abject posture have ye sworn  
            To adore the Conqueror, who now beholds  
            Cherub and Seraph rolling in the flood  
            With scattered arms and ensigns, till anon  
            His swift pursuers from Heaven-gates discern  
            Th’ advantage, and, descending, tread us down  
            Thus drooping, or with linked thunderbolts  
            Transfix us to the bottom of this gulf?  
            Awake, arise, or be for ever fallen!”  
            **They heard**, and were abashed, and up they sprung  
            Upon the wing, as when men wont to watch  
            On duty, sleeping found by whom they dread,  
            Rouse and bestir themselves ere well awake.  
            Nor did they not perceive the evil plight  
            In which they were, or the fierce pains not feel;  
            Yet to their General’s voice they soon obeyed  
            Innumerable. As when the potent rod  
            Of Amram’s son, in Egypt’s evil day,  
            Waved round the coast, up-called a pitchy cloud  
            Of locusts, warping on the eastern wind,  
            That o’er the realm of impious Pharaoh hung  
            Like Night, and darkened all the land of Nile;  
            So numberless were those bad Angels seen  
            Hovering on wing under the cope of Hell,  
            ’Twixt upper, nether, and surrounding fires;  
            Till, as a signal given, th’ uplifted spear  
            Of their great Sultan waving to direct  
            Their course, in even balance down they light  
            On the firm brimstone, and fill all the plain:  
            A multitude like which the populous North  
            Poured never from her frozen loins to pass  
            Rhene or the Danaw, when her barbarous sons  
            Came like a deluge on the South, and spread  
            Beneath Gibraltar to the Libyan sands.  
            Forthwith, form every squadron and each band,  
            The heads and leaders thither haste where stood  
            Their great Commander—godlike Shapes, and Forms  
            Excelling human; princely Dignities;  
            And Powers that erst in Heaven sat on thrones,  
            Though on their names in Heavenly records now  
            Be no memorial, blotted out and rased  
            By their rebellion from the Books of Life.  
            Nor had they yet among the sons of Eve  
            Got them new names, till, wandering o’er the earth,  
            Through God’s high sufferance for the trial of man,  
            By falsities and lies the greatest part  
            Of mankind they corrupted to forsake  
            God their Creator, and th’ invisible  
            Glory of him that made them to transform  
            Oft to the image of a brute, adorned  
            With gay religions full of pomp and gold,  
            And devils to adore for deities:  
            Then were they known to men by various names,  
            And various idols through the heathen world.  
            **Say, Muse,** their names then known, who first, who last,  
            Roused from the slumber on that fiery couch,  
            At their great Emperorr’s call, as next in worth  
            Came singly where he stood on the bare strand,  
            While the promiscuous crowd stood yet aloof?  
            **The chief were** those who, from the pit of Hell  
            Roaming to seek their prey on Earth, durst fix  
            Their seats, long after, next the seat of God,  
            Their altars by his altar, gods adored  
            Among the nations round, and durst abide  
            Jehovah thundering out of Sion, throned  
            Between the Cherubim; yea, often placed  
            Within his sanctuary itself their shrines,  
            Abominations; and with cursed things  
            His holy rites and solemn feasts profaned,  
            And with their darkness durst affront his light.  
            First, Moloch, horrid king, besmeared with blood  
            Of human sacrifice, and parents’ tears;  
            Though, for the noise of drums and timbrels loud,  
            Their children’s cries unheard that passed through fire  
            To his grim idol. Him the Ammonite  
            Worshiped in Rabba and her watery plain,  
            In Argob and in Basan, to the stream  
            Of utmost Arnon. Nor content with such  
            Audacious neighbourhood, the wisest heart  
            Of Solomon he led by fraud to build  
            His temple right against the temple of God  
            On that opprobrious hill, and made his grove  
            The pleasant valley of Hinnom, Tophet thence  
            And black Gehenna called, the type of Hell.  
            Next Chemos, th’ obscene dread of Moab’s sons,  
            From Aroar to Nebo and the wild  
            Of southmost Abarim; in Hesebon  
            And Horonaim, Seon’s real, beyond  
            The flowery dale of Sibma clad with vines,  
            And Eleale to th’ Asphaltic Pool:  
            Peor his other name, when he enticed  
            Israel in Sittim, on their march from Nile,  
            To do him wanton rites, which cost them woe.  
            Yet thence his lustful orgies he enlarged  
            Even to that hill of scandal, by the grove  
            Of Moloch homicide, lust hard by hate,  
            Till good Josiah drove them thence to Hell.  
            With these came they who, from the bordering flood  
            Of old Euphrates to the brook that parts  
            Egypt from Syrian ground, had general names  
            Of Baalim and Ashtaroth—those male,  
            These feminine. For Spirits, when they please,  
            Can either sex assume, or both; so soft  
            And uncompounded is their essence pure,  
            Not tried or manacled with joint or limb,  
            Nor founded on the brittle strength of bones,  
            Like cumbrous flesh; but, in what shape they choose,  
            Dilated or condensed, bright or obscure,  
            Can execute their airy purposes,  
            And works of love or enmity fulfil.  
            For those the race of Israel oft forsook  
            Their Living Strength, and unfrequented left  
            His righteous altar, bowing lowly down  
            To bestial gods; for which their heads as low  
            Bowed down in battle, sunk before the spear  
            Of despicable foes. With these in troop  
            Came Astoreth, whom the Phoenicians called  
            Astarte, queen of heaven, with crescent horns;  
            To whose bright image nightly by the moon  
            Sidonian virgins paid their vows and songs;  
            In Sion also not unsung, where stood  
            Her temple on th’ offensive mountain, built  
            By that uxorious king whose heart, though large,  
            Beguiled by fair idolatresses, fell  
            To idols foul. Thammuz came next behind,  
            Whose annual wound in Lebanon allured  
            The Syrian damsels to lament his fate  
            In amorous ditties all a summer’s day,  
            While smooth Adonis from his native rock  
            Ran purple to the sea, supposed with blood  
            Of Thammuz yearly wounded: the love-tale  
            Infected Sion’s daughters with like heat,  
            Whose wanton passions in the sacred porch  
            Ezekiel saw, when, by the vision led,  
            His eye surveyed the dark idolatries  
            Of alienated Judah. Next came one  
            Who mourned in earnest, when the captive ark  
            Maimed his brute image, head and hands lopt off,  
            In his own temple, on the grunsel-edge,  
            Where he fell flat and shamed his worshippers:  
            Dagon his name, sea-monster, upward man  
            And downward fish; yet had his temple high  
            Reared in Azotus, dreaded through the coast  
            Of Palestine, in Gath and Ascalon,  
            And Accaron and Gaza’s frontier bounds.  
            Him followed Rimmon, whose delightful seat  
            Was fair Damascus, on the fertile banks  
            Of Abbana and Pharphar, lucid streams.  
            He also against the house of God was bold:  
            A leper once he lost, and gained a king—  
            Ahaz, his sottish conqueror, whom he drew  
            God’s altar to disparage and displace  
            For one of Syrian mode, whereon to burn  
            His odious offerings, and adore the gods  
            Whom he had vanquished. After these appeared  
            A crew who, under names of old renown—  
            Osiris, Isis, Orus, and their train—  
            With monstrous shapes and sorceries abused  
            Fanatic Egypt and her priests to seek  
            Their wandering gods disguised in brutish forms  
            Rather than human. Nor did Israel scape  
            Th’ infection, when their borrowed gold composed  
            The calf in Oreb; and the rebel king  
            Doubled that sin in Bethel and in Dan,  
            Likening his Maker to the grazed ox—  
            Jehovah, who, in one night, when he passed  
            From Egypt marching, equalled with one stroke  
            Both her first-born and all her bleating gods.  
            Belial came last; than whom a Spirit more lewd  
            Fell not from Heaven, or more gross to love  
            Vice for itself. To him no temple stood  
            Or altar smoked; yet who more oft than he  
            In temples and at altars, when the priest  
            Turns atheist, as did Eli’s sons, who filled  
            With lust and violence the house of God?  
            In courts and palaces he also reigns,  
            And in luxurious cities, where the noise  
            Of riot ascends above their loftiest towers,  
            And injury and outrage; and, when night  
            Darkens the streets, then wander forth the sons  
            Of Belial, flown with insolence and wine.  
            Witness the streets of Sodom, and that night  
            In Gibeah, when the hospitable door  
            Exposed a matron, to avoid worse rape.  
            **These were the** prime in order and in might:  
            The rest were long to tell; though far renowned  
            Th’ Ionian gods—of Javan’s issue held  
            Gods, yet confessed later than Heaven and Earth,  
            Their boasted parents;—Titan, Heaven’s first-born,  
            With his enormous brood, and birthright seized  
            By younger Saturn: he from mightier Jove,  
            His own and Rhea’s son, like measure found;  
            So Jove usurping reigned. These, first in Crete  
            And Ida known, thence on the snowy top  
            Of cold Olympus ruled the middle air,  
            Their highest heaven; or on the Delphian cliff,  
            Or in Dodona, and through all the bounds  
            Of Doric land; or who with Saturn old  
            Fled over Adria to th’ Hesperian fields,  
            And o’er the Celtic roamed the utmost Isles.  
            **All these and** more came flocking; but with looks  
            Downcast and damp; yet such wherein appeared  
            Obscure some glimpse of joy to have found their Chief  
            Not in despair, to have found themselves not lost  
            In loss itself; which on his countenance cast  
            Like doubtful hue. But he, his wonted pride  
            Soon recollecting, with high words, that bore  
            Semblance of worth, not substance, gently raised  
            Their fainting courage, and dispelled their fears.  
            Then straight commands that, at the warlike sound  
            Of trumpets loud and clarions, be upreared  
            His mighty standard. That proud honour claimed  
            Azazel as his right, a Cherub tall:  
            Who forthwith from the glittering staff unfurled  
            Th’ imperial ensign; which, full high advanced,  
            Shone like a meteor streaming to the wind,  
            With gems and golden lustre rich emblazed,  
            Seraphic arms and trophies; all the while  
            Sonorous metal blowing martial sounds:  
            At which the universal host up-sent  
            A shout that tore Hell’s concave, and beyond  
            Frighted the reign of Chaos and old Night.  
            All in a moment through the gloom were seen  
            Ten thousand banners rise into the air,  
            With orient colours waving: with them rose  
            A forest huge of spears; and thronging helms  
            Appeared, and serried shields in thick array  
            Of depth immeasurable. Anon they move  
            In perfect phalanx to the Dorian mood  
            Of flutes and soft recorders—such as raised  
            To height of noblest temper heroes old  
            Arming to battle, and instead of rage  
            Deliberate valour breathed, firm, and unmoved  
            With dread of death to flight or foul retreat;  
            Nor wanting power to mitigate and swage  
            With solemn touches troubled thoughts, and chase  
            Anguish and doubt and fear and sorrow and pain  
            From mortal or immortal minds. Thus they,  
            Breathing united force with fixed thought,  
            Moved on in silence to soft pipes that charmed  
            Their painful steps o’er the burnt soil. And now  
            Advanced in view they stand—a horrid front  
            Of dreadful length and dazzling arms, in guise  
            Of warriors old, with ordered spear and shield,  
            Awaiting what command their mighty Chief  
            Had to impose. He through the armed files  
            Darts his experienced eye, and soon traverse  
            The whole battalion views—their order due,  
            Their visages and stature as of gods;  
            Their number last he sums. And now his heart  
            Distends with pride, and, hardening in his strength,  
            Glories: for never, since created Man,  
            Met such embodied force as, named with these,  
            Could merit more than that small infantry  
            Warred on by cranes—though all the giant brood  
            Of Phlegra with th’ heroic race were joined  
            That fought at Thebes and Ilium, on each side  
            Mixed with auxiliar gods; and what resounds  
            In fable or romance of Uther’s son,  
            Begirt with British and Armoric knights;  
            And all who since, baptized or infidel,  
            Jousted in Aspramont, or Montalban,  
            Damasco, or Marocco, or Trebisond,  
            Or whom Biserta sent from Afric shore  
            When Charlemain with all his peerage fell  
            By Fontarabbia. Thus far these beyond  
            Compare of mortal prowess, yet observed  
            Their dread Commander. He, above the rest  
            In shape and gesture proudly eminent,  
            Stood like a tower. His form had yet not lost  
            All her original brightness, nor appeared  
            Less than Archangel ruined, and th’ excess  
            Of glory obscured: as when the sun new-risen  
            Looks through the horizontal misty air  
            Shorn of his beams, or, from behind the moon,  
            In dim eclipse, disastrous twilight sheds  
            On half the nations, and with fear of change  
            Perplexes monarchs. Darkened so, yet shone  
            Above them all th’ Archangel: but his face  
            Deep scars of thunder had intrenched, and care  
            Sat on his faded cheek, but under brows  
            Of dauntless courage, and considerate pride  
            Waiting revenge. Cruel his eye, but cast  
            Signs of remorse and passion, to behold  
            The fellows of his crime, the followers rather  
            (Far other once beheld in bliss), condemned  
            For ever now to have their lot in pain—  
            Millions of Spirits for his fault amerced  
            Of Heaven, and from eternal splendours flung  
            For his revolt—yet faithful how they stood,  
            Their glory withered; as, when heaven’s fire  
            Hath scathed the forest oaks or mountain pines,  
            With singed top their stately growth, though bare,  
            Stands on the blasted heath. He now prepared  
            To speak; whereat their doubled ranks they bend  
            From wing to wing, and half enclose him round  
            With all his peers: attention held them mute.  
            Thrice he assayed, and thrice, in spite of scorn,  
            Tears, such as Angels weep, burst forth: at last  
            Words interwove with sighs found out their way:—  
            “**O myriads** of immortal Spirits! O Powers  
            Matchless, but with th’ Almighty!—and that strife  
            Was not inglorious, though th’ event was dire,  
            As this place testifies, and this dire change,  
            Hateful to utter. But what power of mind,  
            Forseeing or presaging, from the depth  
            Of knowledge past or present, could have feared  
            How such united force of gods, how such  
            As stood like these, could ever know repulse?  
            For who can yet believe, though after loss,  
            That all these puissant legions, whose exile  
            Hath emptied Heaven, shall fail to re-ascend,  
            Self-raised, and repossess their native seat?  
            For me, be witness all the host of Heaven,  
            If counsels different, or danger shunned  
            By me, have lost our hopes. But he who reigns  
            Monarch in Heaven till then as one secure  
            Sat on his throne, upheld by old repute,  
            Consent or custom, and his regal state  
            Put forth at full, but still his strength concealed—  
            Which tempted our attempt, and wrought our fall.  
            Henceforth his might we know, and know our own,  
            So as not either to provoke, or dread  
            New war provoked: our better part remains  
            To work in close design, by fraud or guile,  
            What force effected not; that he no less  
            At length from us may find, who overcomes  
            By force hath overcome but half his foe.  
            Space may produce new Worlds; whereof so rife  
            There went a fame in Heaven that he ere long  
            Intended to create, and therein plant  
            A generation whom his choice regard  
            Should favour equal to the Sons of Heaven.  
            Thither, if but to pry, shall be perhaps  
            Our first eruption—thither, or elsewhere;  
            For this infernal pit shall never hold  
            Celestial Spirits in bondage, nor th’ Abyss  
            Long under darkness cover. But these thoughts  
            Full counsel must mature. Peace is despaired;  
            For who can think submission? War, then, war  
            Open or understood, must be resolved.”  
            **He spake**; and, to confirm his words, outflew  
            Millions of flaming swords, drawn from the thighs  
            Of mighty Cherubim; the sudden blaze  
            Far round illumined Hell. Highly they raged  
            Against the Highest, and fierce with grasped arms  
            Clashed on their sounding shields the din of war,  
            Hurling defiance toward the vault of Heaven.  
            **There stood a** hill not far, whose grisly top  
            Belched fire and rolling smoke; the rest entire  
            Shone with a glossy scurf—undoubted sign  
            That in his womb was hid metallic ore,  
            The work of sulphur. Thither, winged with speed,  
            A numerous brigade hastened: as when bands  
            Of pioneers, with spade and pickaxe armed,  
            Forerun the royal camp, to trench a field,  
            Or cast a rampart. Mammon led them on—  
            Mammon, the least erected Spirit that fell  
            From Heaven; for even in Heaven his looks and thoughts  
            Were always downward bent, admiring more  
            The riches of heaven’s pavement, trodden gold,  
            Than aught divine or holy else enjoyed  
            In vision beatific. By him first  
            Men also, and by his suggestion taught,  
            Ransacked the centre, and with impious hands  
            Rifled the bowels of their mother Earth  
            For treasures better hid. Soon had his crew  
            Opened into the hill a spacious wound,  
            And digged out ribs of gold. Let none admire  
            That riches grow in Hell; that soil may best  
            Deserve the precious bane. And here let those  
            Who boast in mortal things, and wondering tell  
            Of Babel, and the works of Memphian kings,  
            Learn how their greatest monuments of fame  
            And strength, and art, are easily outdone  
            By Spirits reprobate, and in an hour  
            What in an age they, with incessant toil  
            And hands innumerable, scarce perform.  
            Nigh on the plain, in many cells prepared,  
            That underneath had veins of liquid fire  
            Sluiced from the lake, a second multitude  
            With wondrous art founded the massy ore,  
            Severing each kind, and scummed the bullion-dross.  
            A third as soon had formed within the ground  
            A various mould, and from the boiling cells  
            By strange conveyance filled each hollow nook;  
            As in an organ, from one blast of wind,  
            To many a row of pipes the sound-board breathes.  
            Anon out of the earth a fabric huge  
            Rose like an exhalation, with the sound  
            Of dulcet symphonies and voices sweet—  
            Built like a temple, where pilasters round  
            Were set, and Doric pillars overlaid  
            With golden architrave; nor did there want  
            Cornice or frieze, with bossy sculptures graven;  
            The roof was fretted gold. Not Babylon  
            Nor great Alcairo such magnificence  
            Equalled in all their glories, to enshrine  
            Belus or Serapis their gods, or seat  
            Their kings, when Egypt with Assyria strove  
            In wealth and luxury. Th’ ascending pile  
            Stood fixed her stately height, and straight the doors,  
            Opening their brazen folds, discover, wide  
            Within, her ample spaces o’er the smooth  
            And level pavement: from the arched roof,  
            Pendent by subtle magic, many a row  
            Of starry lamps and blazing cressets, fed  
            With naptha and asphaltus, yielded light  
            As from a sky. The hasty multitude  
            Admiring entered; and the work some praise,  
            And some the architect. His hand was known  
            In Heaven by many a towered structure high,  
            Where sceptred Angels held their residence,  
            And sat as Princes, whom the supreme King  
            Exalted to such power, and gave to rule,  
            Each in his Hierarchy, the Orders bright.  
            Nor was his name unheard or unadored  
            In ancient Greece; and in Ausonian land  
            Men called him Mulciber; and how he fell  
            From Heaven they fabled, thrown by angry Jove  
            Sheer o’er the crystal battlements: from morn  
            To noon he fell, from noon to dewy eve,  
            A summer’s day, and with the setting sun  
            Dropt from the zenith, like a falling star,  
            On Lemnos, th’ Aegaean isle. Thus they relate,  
            Erring; for he with this rebellious rout  
            Fell long before; nor aught availed him now  
            To have built in Heaven high towers; nor did he scape  
            By all his engines, but was headlong sent,  
            With his industrious crew, to build in Hell.  
            **Meanwhile the winged Heralds**, by command  
            Of sovereign power, with awful ceremony  
            And trumpet’s sound, throughout the host proclaim  
            A solemn council forthwith to be held  
            At Pandemonium, the high capital  
            Of Satan and his peers. Their summons called  
            From every band and squared regiment  
            By place or choice the worthiest: they anon  
            With hundreds and with thousands trooping came  
            Attended. All access was thronged; the gates  
            And porches wide, but chief the spacious hall  
            (Though like a covered field, where champions bold  
            Wont ride in armed, and at the Soldan’s chair  
            Defied the best of Paynim chivalry  
            To mortal combat, or career with lance),  
            Thick swarmed, both on the ground and in the air,  
            Brushed with the hiss of rustling wings. As bees  
            In spring-time, when the Sun with Taurus rides.  
            Pour forth their populous youth about the hive  
            In clusters; they among fresh dews and flowers  
            Fly to and fro, or on the smoothed plank,  
            The suburb of their straw-built citadel,  
            New rubbed with balm, expatiate, and confer  
            Their state-affairs: so thick the airy crowd  
            Swarmed and were straitened; till, the signal given,  
            Behold a wonder! They but now who seemed  
            In bigness to surpass Earth’s giant sons,  
            Now less than smallest dwarfs, in narrow room  
            Throng numberless—like that pygmean race  
            Beyond the Indian mount; or faery elves,  
            Whose midnight revels, by a forest-side  
            Or fountain, some belated peasant sees,  
            Or dreams he sees, while overhead the Moon  
            Sits arbitress, and nearer to the Earth  
            Wheels her pale course: they, on their mirth and dance  
            Intent, with jocund music charm his ear;  
            At once with joy and fear his heart rebounds.  
            Thus incorporeal Spirits to smallest forms  
            Reduced their shapes immense, and were at large,  
            Though without number still, amidst the hall  
            Of that infernal court. But far within,  
            And in their own dimensions like themselves,  
            The great Seraphic Lords and Cherubim  
            In close recess and secret conclave sat,  
            A thousand demi-gods on golden seats,  
            Frequent and full. After short silence then,  
            And summons read, the great consult began.  
            """,
            summary: """
            > Book 1 opens with Milton's invocation to the Heavenly Muse, declaring his ambitious theme: humanity's first disobedience and the loss of Eden. The narrative begins in medias res with Satan and his fallen angels lying defeated on a burning lake in Hell. Despite their catastrophic loss, Satan demonstrates his formidable rhetorical powers, delivering defiant speeches that refuse submission to God. His famous declaration "Better to reign in Hell than serve in Heaven" encapsulates his pride and rebellious spirit. The fallen angels, including Beelzebub and Moloch, rise from the lake and assemble. They construct Pandemonium, a magnificent palace, showcasing their diminished but still considerable powers. Milton establishes the epic's central conflict between divine authority and satanic rebellion while introducing themes of free will, pride, and the consequences of disobedience. Satan emerges as a complex, almost sympathetic anti-hero whose grandeur and defiance captivate readers even as Milton condemns his sin.
            """,
            context: "Satan and rebel angels wake in Hell after their failed rebellion. Satan rallies his forces, refusing to submit to God. They build Pandemonium, their capital, and hold council to plot revenge against God through His new creation, mankind."
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
            summary: """
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
        ),
        BookContent(
            id: 3,
            title: "Book III",
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
            summary: """
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
        ),
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
                                    summarySection
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
                Text("Introduction")
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
            Text("◉ Original Text")
                .font(.system(size: sectionHeaderBase * scale, weight: .semibold))
                .foregroundColor(isDarkMode ? .white : .primary)
            
            Markdown(currentContent.originalText)
                .markdownTheme(currentMarkdownTheme)
        }
    }
    
    // 中文翻譯區塊（Markdown）
    var summarySection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("◉ Summary")
                .font(.system(size: sectionHeaderBase * scale, weight: .semibold))
                .foregroundColor(isDarkMode ? .white : .primary)
            
            Markdown(currentContent.summary)
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
