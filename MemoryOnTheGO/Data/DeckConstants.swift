//
//  DeckConstants.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 2/19/26.
//

import Foundation

@MainActor
let USHistoryCards = [
    FlashCard(
        question: "What document contains the first ten amendments to the US Constitution?",
        answer: "Bill of Rights",
        img: UniversalImage.asset("J-Broad-St"),
        sortOrder: 0
    ),
    FlashCard(
        question: "Which founding father famously flew a kite to demonstrate the electrical nature of lightning?",
        answer: "Franklin (Benjamin)",
        img: UniversalImage.asset("J-Fulton-St"),
        sortOrder: 1
    ),
    FlashCard(
        question: "What is the supreme law of the United States, ratified in 1788?",
        answer: "Constitution",
        img: UniversalImage.asset("J-Chambers-St"),
        sortOrder: 2
    ),
    FlashCard(
        question: "What war was fought between the Union and the Confederacy from 1861 to 1865?",
        answer: "Civil War",
        img: UniversalImage.asset("J-Canal-St"),
        sortOrder: 3
    ),
    FlashCard(
        question: "What 1773 political protest involved dumping 342 chests of imported goods into the harbor?",
        answer: "Boston Tea Party",
        img: UniversalImage.asset("J-Bowery"),
        sortOrder: 4
    ),
    FlashCard(
        question: "What 1776 document announced the separation of the 13 colonies from Great Britain?",
        answer: "Declaration of Independence",
        img: UniversalImage.asset("J-Delancey-St-Essex-St"),
        sortOrder:5
    ),
    FlashCard(
        question: "What 1823 policy warned European nations against interfering in the Western Hemisphere?",
        answer: "Monroe Doctrine",
        img: UniversalImage.asset("J-Marcy-Ave"),
        sortOrder: 6
    ),
    FlashCard(
        question: "Who was the first Secretary of the Treasury of the United States?",
        answer: "Hamilton (Alexander)",
        img: UniversalImage.asset("J-Hewes-St"),
        sortOrder: 7
    ),
    FlashCard(
        question: "Which president issued the Emancipation Proclamation?",
        answer: "Lincoln (Abraham)",
        img: UniversalImage.asset("J-Lorimer-St"),
        sortOrder: 8
    ),
    FlashCard(
        question: "What collection of 85 essays urged the ratification of the US Constitution?",
        answer: "Federalist Papers",
        img: UniversalImage.asset("J-Flushing-Ave"),
        sortOrder: 9
    ),
   
]

@MainActor
let BiologyCards: [FlashCard] = [
    FlashCard(
        question: "What is the basic structural and functional unit of all living organisms?",
        answer: "Cell",
        img: UniversalImage.asset("G-Court-Sq"),
        sortOrder: 0
    ),
    FlashCard(
        question: "What is the final phase of cell division where two nuclei are formed?",
        answer: "Telophase",
        img: UniversalImage.asset("G-21-St"),
        sortOrder: 1
    ),
    FlashCard(
        question: "What is the study of heredity and the variation of inherited characteristics?",
        answer: "Genetics",
        img: UniversalImage.asset("G-Greenpoint-Ave"),
        sortOrder: 2
    ),
    FlashCard(
        question: "What membrane-bound organelle contains a cell's genetic material?",
        answer: "Nucleus",
        img: UniversalImage.asset("G-Nassau-Ave"),
        sortOrder: 3
    ),
    FlashCard(
        question: "What organelle is known as the powerhouse of the cell?",
        answer: "Mitochondria",
        img: UniversalImage.asset("G-Metropolitan-Ave"),
        sortOrder: 4
    ),
    FlashCard(
        question: "What fluid transports oxygen and nutrients to the cells of the body?",
        answer: "Blood",
        img: UniversalImage.asset("G-Broadway"),
        sortOrder: 5
    ),
    FlashCard(
        question: "What whip-like structure allows a sperm cell or bacterium to move?",
        answer: "Flagella",
        img: UniversalImage.asset("G-Flushing-Ave"),
        sortOrder: 6
    ),
    FlashCard(
        question: "What process results in two identical daughter cells from a single parent cell?",
        answer: "Mitosis",
        img: UniversalImage.asset("G-Myrtle-Willoughby-Aves"),
        sortOrder: 7
    ),
    FlashCard(
        question: "What are single-celled organisms that lack a nucleus?",
        answer: "Bacteria",
        img: UniversalImage.asset("G-Bedford-Notstrand-Aves"),
        sortOrder: 8
    ),
    FlashCard(
        question: "What plant organelle conducts photosynthesis?",
        answer: "Chloroplast",
        img: UniversalImage.asset("G-Classon-Ave"),
        sortOrder: 9
    ),
    FlashCard(
        question: "What thread-like structure of DNA carries genetic information?",
        answer: "Chromosome",
        img: UniversalImage.asset("G-Clinton-Washington-Aves"),
        sortOrder: 10
    ),
]

@MainActor
let ChemistryCards: [FlashCard] = [
    FlashCard(
        question: "What subatomic particle has a negative electric charge?",
        answer: "Electron",
        img: UniversalImage.asset("L-8-Ave"),
        sortOrder: 0
    ),
    FlashCard(
        question: "What highly reactive alkali metal has the atomic symbol Na?",
        answer: "Sodium",
        img: UniversalImage.asset("L-6-Ave"),
        sortOrder: 1
    ),
    FlashCard(
        question: "What is the most electronegative element on the periodic table?",
        answer: "Fluorine",
        img: UniversalImage.asset("L-14-St-Union-Sq"),
        sortOrder: 2
    ),
    FlashCard(
        question: "What strong, low-density transition metal has the atomic number 22?",
        answer: "Titanium",
        img: UniversalImage.asset("L-3-Ave"),
        sortOrder: 3
    ),
    FlashCard(
        question: "What highly radioactive alkali metal is the most electropositive element and has the atomic number 87?",
        answer: "Francium",
        img: UniversalImage.asset("L-1-Ave"),
        sortOrder: 4
    ),
    FlashCard(
        question: "What metalloid is often used to control nuclear reactions and has the symbol B?",
        answer: "Boron",
        img: UniversalImage.asset("L-Bedford-Ave"),
        sortOrder: 5
    ),
    FlashCard(
        question: "What is the lightest solid element under standard conditions?",
        answer: "Lithium",
        img: UniversalImage.asset("L-Lorimer-St"),
        sortOrder: 6
    ),
    FlashCard(
        question: "What dense, malleable transition metal has the chemical symbol Au?",
        answer: "Gold",
        img: UniversalImage.asset("L-Graham-Ave"),
        sortOrder: 7
    ),
    FlashCard(
        question: "What state of matter has no fixed shape and no fixed volume?",
        answer: "Gas",
        img: UniversalImage.asset("L-Grand-St"),
        sortOrder: 8
    ),
    FlashCard(
        question: "What unit of measurement represents 6.022 * 10^23 particles?",
        answer: "Mole",
        img: UniversalImage.asset("L-Montrose-Ave"),
        sortOrder: 9
    ),
    FlashCard(
        question: "What alkaline earth metal burns with a brilliant white light?",
        answer: "Magnesium",
        img: UniversalImage.asset("L-Morgan-Ave"),
        sortOrder: 10
    ),
    FlashCard(
        question: "What is the SI derived unit of energy used in physical chemistry?",
        answer: "Joule",
        img: UniversalImage.asset("L-Jefferson-St"),
        sortOrder: 11
    ),
]

@MainActor
let EarthScienceCards: [FlashCard] = [
    FlashCard(
        question: "What is the most common volcanic rock found in the Earth's oceanic crust?",
        answer: "Basalt",
        img: UniversalImage.asset("R-Bay-Ridge-95-St"),
        sortOrder: 0
    ),
    FlashCard(
        question: "What natural disaster is caused by a sudden release of energy in the Earth's lithosphere?",
        answer: "Earthquake",
        img: UniversalImage.asset("R-86-St"),
        sortOrder: 1
    ),
    FlashCard(
        question: "What type of rock is formed by the accumulation and cementation of mineral or organic particles?",
        answer: "Sedimentary",
        img: UniversalImage.asset("R-77-St"),
        sortOrder: 2
    ),
    FlashCard(
        question: "What instrument is used by meteorologists to measure atmospheric pressure?",
        answer: "Barometer",
        img: UniversalImage.asset("R-Bay-Ridge-Ave"),
        sortOrder: 3
    ),
    FlashCard(
        question: "What is a fracture in rock where there has been movement and displacement?",
        answer: "Fault",
        img: UniversalImage.asset("R-59-St"),
        sortOrder: 4
    ),
    FlashCard(
        question: "What term describes the preserved remains or traces of ancient organisms?",
        answer: "Fossil",
        img: UniversalImage.asset("R-53-St"),
        sortOrder: 5
    ),
    FlashCard(
        question: "What group of rock-forming tectosilicate minerals makes up over 50% of Earth's crust?",
        answer: "Feldspar",
        img: UniversalImage.asset("R-45-St"),
        sortOrder: 6
    ),
    FlashCard(
        question: "What series of ocean waves is caused by large-scale displacement of water, often from earthquakes?",
        answer: "Tsunami",
        img: UniversalImage.asset("R-36-St"),
        sortOrder: 7
    ),
    FlashCard(
        question: "What is the lowest layer of Earth's atmosphere, where most weather occurs?",
        answer: "Troposphere",
        img: UniversalImage.asset("R-25-St"),
        sortOrder: 8
    ),
    FlashCard(
        question: "What supercontinent existed during the late Paleozoic and early Mesozoic eras?",
        answer: "Pangaea",
        img: UniversalImage.asset("R-Prospect-Ave"),
        sortOrder: 9
    ),
    FlashCard(
        question: "What term refers to any separation in a geologic formation that divides the rock into two or more pieces?",
        answer: "Fracture",
        img: UniversalImage.asset("R-4-Ave-9-St"),
        sortOrder: 10
    ),
    FlashCard(
        question: "What encompasses all of space, time, and their contents, including planets, stars, and galaxies?",
        answer: "Universe",
        img: UniversalImage.asset("R-Union-St"),
        sortOrder: 11
    ),
    FlashCard(
        question: "What highly viscous, ductile layer of the Earth's upper mantle lies directly beneath the lithosphere and allows tectonic plates to move?",
        answer: "Asthenosphere",
        img: UniversalImage.asset("R-Atlantic-Ave-Barclays-Center"),
        sortOrder: 12
    ),
    FlashCard(
        question: "What landform is created by the deposition of sediment at the mouth of a river?",
        answer: "Delta",
        img: UniversalImage.asset("R-DeKalb-Ave"),
        sortOrder: 13
    )
]

@MainActor
let PhysicsCards: [FlashCard] = [
    FlashCard(
        question: "What scalar quantity refers to how fast an object is moving?",
        answer: "Speed",
        img: UniversalImage.asset("1-South-Ferry"),
        sortOrder: 0
    ),
    FlashCard(
        question: "What is the measure of the opposition to current flow in an electrical circuit?",
        answer: "Resistance",
        img: UniversalImage.asset("1-Rector-St"),
        sortOrder: 1
    ),
    FlashCard(
        question: "What is calculated by multiplying force by the displacement of the object?",
        answer: "Work",
        img: UniversalImage.asset("1-WTC-Cortlandt"),
        sortOrder: 2
    ),
    FlashCard(
        question: "What term describes the rate of flow of electric charge?",
        answer: "Current",
        img: UniversalImage.asset("1-Chambers-St"),
        sortOrder: 3
    ),
    FlashCard(
        question: "What vector quantity causes an object to accelerate, often described as a push or a pull?",
        answer: "Force",
        img: UniversalImage.asset("1-Franklin-St"),
        sortOrder: 4
    ),
    FlashCard(
        question: "What fundamental property of matter causes it to experience a force when placed in an electromagnetic field?",
        answer: "Charge",
        img: UniversalImage.asset("1-Canal-St"),
        sortOrder: 5
    ),
    FlashCard(
        question: "What is the SI unit of frequency, equivalent to one cycle per second?",
        answer: "Hertz",
        img: UniversalImage.asset("1-Houston-St"),
        sortOrder: 6
    ),
    FlashCard(
        question: "What is the SI unit of electric charge?",
        answer: "Coulomb",
        img: UniversalImage.asset("1-Christopher-St"),
        sortOrder: 7
    ),
    FlashCard(
        question: "What force resists the relative motion of solid surfaces, fluid layers, and material elements sliding against each other?",
        answer: "Friction",
        img: UniversalImage.asset("1-14-St"),
        sortOrder: 8
    ),
    FlashCard(
        question: "What physical quantity must be transferred to a body or physical system to perform work?",
        answer: "Energy",
        img: UniversalImage.asset("1-18-St"),
        sortOrder: 9
    ),
    FlashCard(
        question: "What is the rotational equivalent of linear force?",
        answer: "Torque",
        img: UniversalImage.asset("1-23-St"),
        sortOrder: 10
    ),
    FlashCard(
        question: "What branch of physics deals with heat, work, and temperature?",
        answer: "Thermodynamics",
        img: UniversalImage.asset("1-28-St"),
        sortOrder: 11
    ),
    FlashCard(
        question: "What pulling force is transmitted axially by means of a string, cable, or chain?",
        answer: "Tension",
        img: UniversalImage.asset("1-34-St-Penn-Station"),
        sortOrder: 12
    ),
    FlashCard(
        question: "What property of a wave is determined by the number of wave crests passing a fixed point per second?",
        answer: "Frequency",
        img: UniversalImage.asset("1-42-St-Times-Sq"),
        sortOrder: 13
    ),
]

@MainActor
let GeographyCards: [FlashCard] = [
    FlashCard(
        question: "What Western European country is home to the Eiffel Tower and the Louvre?",
        answer: "France",
        img: UniversalImage.asset("7-Flushing-Main-St"),
        sortOrder: 0
    ),
    FlashCard(
        question: "What large island nation is located off the southeastern coast of Africa?",
        answer: "Madagascar",
        img: UniversalImage.asset("7-Mets-Willets-Pt"),
        sortOrder: 1
    ),
    FlashCard(
        question: "What is the capital city of Canada?",
        answer: "Ottawa",
        img: UniversalImage.asset("7-111-St"),
        sortOrder: 2
    ),
    FlashCard(
        question: "What is the capital city of Norway?",
        answer: "Oslo",
        img: UniversalImage.asset("7-103-St-Corona-Plaza"),
        sortOrder: 3
    ),
    FlashCard(
        question: "What East Asian island nation is known as the Land of the Rising Sun?",
        answer: "Japan",
        img: UniversalImage.asset("7-Junction-Blvd"),
        sortOrder: 4
    ),
    FlashCard(
        question: "What river, flowing north through northeastern Africa, is often regarded as the longest river in the world?",
        answer: "Nile",
        img: UniversalImage.asset("7-90-St-Elmhurst-Ave"),
        sortOrder: 5
    ),
    FlashCard(
        question: "What South American country derives its name from the equator, which runs directly through it?",
        answer: "Ecuador",
        img: UniversalImage.asset("7-82-St-Jackson-Hts"),
        sortOrder: 6
    ),
    FlashCard(
        question: "What is the largest hot desert in the world, located in North Africa?",
        answer: "Sahara",
        img: UniversalImage.asset("7-74-St-Broadway"),
        sortOrder: 7
    ),
    FlashCard(
        question: "What European country occupies the majority of the Iberian Peninsula?",
        answer: "Spain",
        img: UniversalImage.asset("7-69-St"),
        sortOrder: 8
    ),
    FlashCard(
        question: "What landlocked European country is famous for the Alps and its historical neutrality?",
        answer: "Switzerland",
        img: UniversalImage.asset("7-61-St-Woodside"),
        sortOrder: 9
    ),
    FlashCard(
        question: "What Nordic country is often called the Land of a Thousand Lakes?",
        answer: "Finland",
        img: UniversalImage.asset("7-52-St"),
        sortOrder: 10
    ),
    FlashCard(
        question: "What island country in Melanesia has Suva as its capital?",
        answer: "Fiji",
        img: UniversalImage.asset("7-46-St-Bliss-St"),
        sortOrder: 11
    ),
    FlashCard(
        question: "Which US state is the southernmost contiguous state in the country?",
        answer: "Florida",
        img: UniversalImage.asset("7-40-St-Lowery-St"),
        sortOrder: 12
    ),
    FlashCard(
        question: "What transcontinental country acts as a bridge between Europe and Asia?",
        answer: "Turkey",
        img: UniversalImage.asset("7-33-St-Rawson-St"),
        sortOrder: 13
    ),
    FlashCard(
        question: "What is the highest official capital city in the world, located in the Andes?",
        answer: "Quito",
        img: UniversalImage.asset("7-Queensboro-Plaza"),
        sortOrder: 14
    ),
]

@MainActor
let LiteratureCards : [FlashCard] = [
    FlashCard(
        question: "Which Irish poet wrote The Second Coming?",
        answer: "Yeats (W.B.)",
        img: UniversalImage.asset("F-York-St"),
        sortOrder: 0
    ),
    FlashCard(
        question: "Which Transcendentalist essayist wrote Self-Reliance?",
        answer: "Emerson (Ralph Waldo)",
        img: UniversalImage.asset("F-East-Broadway"),
        sortOrder: 1
    ),
    FlashCard(
        question: "Who wrote the classic Victorian novels A Tale of Two Cities and Great Expectations?",
        answer: "Dickens (Charles)",
        img: UniversalImage.asset("F-Delancey-St-Essex-St"),
        sortOrder: 2
    ),
    FlashCard(
        question: "Which American author wrote the classic coming-of-age novel The Catcher in the Rye?",
        answer: "Salinger (J.D.)",
        img: UniversalImage.asset("F-2-Ave"),
        sortOrder: 3
    ),
    FlashCard(
        question: "Which dystopian author wrote Fahrenheit 451?",
        answer: "Bradbury (Ray)",
        img: UniversalImage.asset("F-Broadway-Lafayette-St"),
        sortOrder: 4
    ),
    FlashCard(
        question: "Which American poet wrote the collection Leaves of Grass?",
        answer: "Whitman (Walt)",
        img: UniversalImage.asset("F-W-4-St-Wash-Sq"),
        sortOrder: 5
    ),
    FlashCard(
        question: "Which Lost Generation author wrote The Great Gatsby?",
        answer: "Fitzgerald (F. Scott)",
        img: UniversalImage.asset("F-14-St"),
        sortOrder: 6
    ),
    FlashCard(
        question: "Which English fantasy author wrote The Hobbit and The Lord of the Rings?",
        answer: "Tolkien (J.R.R.)",
        img: UniversalImage.asset("F-23-St"),
        sortOrder: 7
    ),
    FlashCard(
        question: "Which Russian realist author wrote War and Peace and Anna Karenina?",
        answer: "Tolstoy (Leo)",
        img: UniversalImage.asset("F-34-St-Herald-Sq"),
        sortOrder: 8
    ),
    FlashCard(
        question: "Which American poet wrote The Road Not Taken?",
        answer: "Frost (Robert)",
        img: UniversalImage.asset("F-42-St-Bryant-Pk"),
        sortOrder: 9
    ),
    FlashCard(
        question: "Which Southern Gothic writer authored The Sound and the Fury?",
        answer: "Faulkner (William)",
        img: UniversalImage.asset("F-47-50-Sts-Rockefeller-Ctr"),
        sortOrder: 10
    ),
    FlashCard(
        question: "Which French author wrote the highly influential novel Madame Bovary?",
        answer: "Flaubert (Gustave)",
        img: UniversalImage.asset("F-5-Ave-53-St"),
        sortOrder: 11
    ),
    FlashCard(
        question: "Which American author wrote the survival novel The Call of the Wild?",
        answer: "London (Jack)",
        img: UniversalImage.asset("F-Lexington-Ave-53-St"),
        sortOrder: 12
    ),
    FlashCard(
        question: "Which classic 1953 Arthur Miller play dramatizes the Salem witch trials?",
        answer: "Crucible (The)",
        img: UniversalImage.asset("F-Court-Sq-23-St"),
        sortOrder: 13
    ),
    FlashCard(
        question: "What is the name of the idealistic, windmill-tilting knight in Miguel de Cervantes' landmark Spanish novel?",
        answer: "Quixote (Don)",
        img: UniversalImage.asset("F-Queens-Plaza"),
        sortOrder: 14
    ),
    FlashCard(
        question: "Which modernist Irish author wrote the stream-of-consciousness novel Ulysses?",
        answer: "Joyce (James)",
        img: UniversalImage.asset("F-Jackson-Hts-Roosevelt-Ave"),
        sortOrder: 15
    ),
]

@MainActor
let AppleFactsCards: [FlashCard] = [
    FlashCard(
        question: "What was the very first product designed and sold by Apple in 1976?",
        answer: "Apple I",
        img: UniversalImage.asset("W-Astoria-Ditmars-Blvd"),
        sortOrder: 0
    ),
    FlashCard(
        question: "What digital distribution platform was launched by Apple in 2008 for third-party iOS software?",
        answer: "App Store",
        img: UniversalImage.asset("W-Astoria-Blvd"),
        sortOrder: 1
    ),
    FlashCard(
        question: "Who took over as the CEO of Apple permanently following Steve Jobs' resignation in 2011?",
        answer: "Tim Cook",
        img: UniversalImage.asset("W-30-Ave"),
        sortOrder: 2
    ),
    FlashCard(
        question: "Which rival tech founder famously announced a crucial $150 million investment in Apple at Macworld 1997?",
        answer: "Bill Gates",
        img: UniversalImage.asset("W-Broadway"),
        sortOrder: 3
    ),
    FlashCard(
        question: "In August 2020, Apple became the first U.S. company to reach what historic market capitalization milestone?",
        answer: "Two Trillion Dollars",
        img: UniversalImage.asset("W-36-Ave"),
        sortOrder: 4
    ),
    FlashCard(
        question: "What iconic two-word advertising slogan was used by Apple from 1997 to 2002?",
        answer: "Think Different",
        img: UniversalImage.asset("W-39-Ave"),
        sortOrder: 5
    ),
    FlashCard(
        question: "What extensible multimedia framework was developed by Apple in 1991 for handling digital video and media?",
        answer: "QuickTime",
        img: UniversalImage.asset("W-Queensboro-Plaza"),
        sortOrder: 6
    ),
    FlashCard(
        question: "What was the name of the pioneering 1983 Apple computer that was named after Steve Jobs' daughter?",
        answer: "Lisa",
        img: UniversalImage.asset("W-Lexington-Ave-59-St"),
        sortOrder: 7
    ),
    FlashCard(
        question: "What professional non-linear video editing software is developed natively by Apple?",
        answer: "Final Cut Pro",
        img: UniversalImage.asset("W-5-Ave-59-St"),
        sortOrder: 8
    ),
    FlashCard(
        question: "What biometric system was introduced with the iPhone X in 2017?",
        answer: "Face ID",
        img: UniversalImage.asset("W-57-St-7-Ave"),
        sortOrder: 9
    ),
    FlashCard(
        question: "Which Taiwanese multinational electronics manufacturer is the primary assembler of iPhones?",
        answer: "Foxconn",
        img: UniversalImage.asset("W-49-St"),
        sortOrder: 10
    ),
    FlashCard(
        question: "What OLED strip replaced the physical function keys on MacBook Pros starting in 2016?",
        answer: "Touch Bar",
        img: UniversalImage.asset("W-Times-Sq-42-St"),
        sortOrder: 11
    ),
    FlashCard(
        question: "What lightweight premium metal was used to case the PowerBook G4, the Apple Watch Ultra, and the iPhone 15 Pro?",
        answer: "Titanium",
        img: UniversalImage.asset("W-34-St-Herald-Sq"),
        sortOrder: 12
    ),
    FlashCard(
        question: "What universal port standard finally replaced Apple's proprietary Lightning connector on the iPhone 15?",
        answer: "Type-C (USB-C)",
        img: UniversalImage.asset("W-28-St"),
        sortOrder: 13
    ),
    FlashCard(
        question: "What high-speed hardware interface standard was co-developed by Apple and Intel?",
        answer: "Thunderbolt",
        img: UniversalImage.asset("W-23-St"),
        sortOrder: 14
    ),
    FlashCard(
        question: "What was Apple's proprietary brand name for the IEEE 1394 interface used for high-speed data transfer before USB 3.0?",
        answer: "FireWire",
        img: UniversalImage.asset("W-14-St-Union-Sq"),
        sortOrder: 15
    ),
    FlashCard(
        question: "What wired headphones were introduced alongside the iPhone 5 and iPod Touch 5th Gen in 2012?",
        answer: "EarPods",
        img: UniversalImage.asset("W-8-St-NYU"),
        sortOrder: 16
    ),
    FlashCard(
        question: "What groundbreaking animation studio did Steve Jobs acquire from Lucasfilm in 1986?",
        answer: "Pixar",
        img: UniversalImage.asset("W-Prince-St"),
        sortOrder: 17
    ),
    FlashCard(
        question: "In what California city is Apple's corporate headquarters, Apple Park, located?",
        answer: "Cupertino",
        img: UniversalImage.asset("W-Canal-St"),
        sortOrder: 18
    ),
    FlashCard(
        question: "What Apple software subsidiary was created in 1987 to develop applications like MacWrite and FileMaker?",
        answer: "f",
        img: UniversalImage.asset("W-City-Hall"),
        sortOrder: 19
    ),
]

struct DeckConstants {
    @MainActor static let defaultDecks: [Deck] = [
        Deck(
            name: "Apple Facts",
            desc: "Uncover the hardware, software, and key figures behind the tech empire.",
            pinned: true,
            img: UniversalImage.asset("1-W-train"),
            cards: AppleFactsCards,
        ),
        Deck(
            name: "Physics",
            desc: "Tackle the universal laws governing classical mechanics, electromagnetism, and energy.",
            pinned: true,
            img: UniversalImage.asset("1-1-train"),
            cards: PhysicsCards
        ),
        Deck(
            name: "US History",
            desc: "Master the pivotal events and founding documents of America.",
            img: UniversalImage.asset("1-J-train"),
            cards: USHistoryCards
        ),
        Deck(
            name: "Biology",
            desc: "Explore the fundamental cellular structures and genetics of living organisms.",
            img: UniversalImage.asset("1-G-train"),
            cards: BiologyCards
        ),
        Deck(
            name: "Chemistry",
            desc: "Test your grasp of the periodic table and atomic principles.",
            img: UniversalImage.asset("1-L-train"),
            cards: ChemistryCards
        ),
        Deck(
            name: "Earth Science",
            desc: "Discover the dynamic geological and atmospheric forces shaping our planet.",
            img: UniversalImage.asset("1-R-train"),
            cards: EarthScienceCards
        ),
        Deck(
            name: "Geography",
            desc: "Identify international capital cities, major rivers, and continental landmarks worldwide.",
            img: UniversalImage.asset("1-7-train"),
            cards: GeographyCards
        ),
        Deck(
            name: "Literature",
            desc: "Journey through classic poetry, dystopian fiction, and sweeping historical novels.",
            img: UniversalImage.asset("1-F-train"),
            cards: LiteratureCards
        ),
        
    ]
}
