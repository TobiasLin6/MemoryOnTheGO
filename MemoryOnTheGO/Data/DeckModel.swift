//
//  DeckModel.swift
//  FlashMemory
//
//  Created by Tobias on 1/10/26.
//

import SwiftData
import Foundation

@Model
class FlashCard: Identifiable, CustomStringConvertible{
    var id = UUID()
    var question: String
    var answer: String
    var skill: Int  // 0-5 where 5 is mastered and 0 is just started learning
    var img: String?
    var sound: String?
    
    init(
        question: String,
        answer: String,
        img: String? = nil,
        sound: String? = nil,
    ) {
        self.question = question
        self.answer = answer
        self.skill = 0
        self.img = img
        self.sound = sound
    }
    
    var description: String {
        return "Question: \(question), Answer: \(answer) | Skill: \(skill), Image \(img ?? "None"), Sound: \(sound ?? "None")"
    }
    
    nonisolated func export() -> FlashCardExport {
        FlashCardExport(
            id: id,
            question: question,
            answer: answer,
        )
    }
    
}

@Model
class Deck: Identifiable, CustomStringConvertible {
    var id = UUID()
    var name: String
    var desc: String
    var sortOrder: Int
    var pinned: Bool
    var deletedAt: Date?
    
    private var imageRawValue: String
    
    @Relationship(deleteRule: .cascade)
    var cards: [FlashCard] = []
    
    @Transient
    var img: UniversalImage {
        get { UniversalImage.decode(from: imageRawValue)}
        set { imageRawValue = newValue.encode()}
    }
    
    
    init(
        name: String = "New Deck",
        desc: String = "",
        sortOrder: Int = 0,
        pinned: Bool = false,
        img: UniversalImage = .symbol("photo"),
        cards: [FlashCard] = [],
    ){
        self.name = name
        self.desc = desc
        self.sortOrder = sortOrder
        self.pinned = pinned
        self.imageRawValue = img.encode()
        self.deletedAt = nil
        self.cards = cards
    }
    
    var description: String {
        return "Name: \(name), Description \(desc), Sort Order: \(sortOrder), Pinned: \(pinned), Image: \(img.id), DeletedAt: \(deletedAt?.description ?? "None")"
    }
    
    nonisolated func export() -> DeckExport {
        DeckExport (
            id: id,
            name: name,
            cards: cards.map{$0.export()}
        )
    }
    
    
}


struct FlashCardExport: Codable {
    let id: UUID
    let question: String
    let answer: String
}

struct DeckExport: Codable {
    var id: UUID
    var name: String
    var cards: [FlashCardExport]
}





// For previews
let appleCards = [
    FlashCard(
        question: "In what year was Apple Computer Company founded?",
        answer: "1976"
    ),
    FlashCard(
        question: "Who was the third co-founder of Apple alongside Steve Jobs and Steve Wozniak?",
        answer: "Ronald Wayne"
    ),
    FlashCard(
        question: "What was the first product Apple ever released?",
        answer: "The Apple I (a motherboard kit)"
    ),
    FlashCard(
        question: "Which Newton-inspired image was featured in Apple's first official logo?",
        answer: "Isaac Newton sitting under an apple tree"
    ),
    FlashCard(
        question: "In 1984, Apple introduced the Macintosh with a famous Super Bowl ad. Who directed it?",
        answer: "Ridley Scott"
    ),
    FlashCard(
        question: "What was the name of the handheld PDA Apple released in 1993?",
        answer: "The Newton MessagePad"
    ),
    FlashCard(
        question: "What year was the original iPhone announced by Steve Jobs?",
        answer: "2007"
    ),
    FlashCard(
        question: "What does the 'i' in iMac originally stand for, according to Steve Jobs?",
        answer: "Internet (though it also meant individual, instruct, inform, and inspire)"
    )
]

let appleTriviaDeck = Deck(
    name: "Apple History & Lore",
    desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
    cards: appleCards,
)


