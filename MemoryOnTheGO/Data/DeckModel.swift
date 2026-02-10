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
    var sortOrder: Int
    var searchText: String
    
    var imageRawValue: String
    
    @Transient
    var img: UniversalImage {
        get { UniversalImage.decode(from: imageRawValue)}
        set { imageRawValue = newValue.encode()}
    }
    
    init(
        question: String,
        answer: String,
        img: UniversalImage = .symbol("photo"),
        sortOrder: Int = 0
    ) {
        self.question = question
        self.answer = answer
        self.skill = 0
        self.sortOrder = sortOrder
        self.imageRawValue = img.encode()
        self.searchText = "\(question) \(answer)"
    }
    
    var description: String {
        return "Question: \(question), Answer: \(answer) | Skill: \(skill), Image \(img.id) | SortOrder: \(sortOrder)"
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
    var searchText: String
    
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
        self.searchText = "\(name) \(desc)"
    }
    
    var description: String {
        return "Name: \(name), Description \(desc), Sort Order: \(sortOrder), Pinned: \(pinned), Image: \(img.id), DeletedAt: \(deletedAt?.description ?? "None")"
    }
    
}

// For previews
@MainActor
let appleCards = [
    FlashCard(
        question: "In what year was Apple Computer Company founded?",
        answer: "1976",
        sortOrder: 0
    ),
    FlashCard(
        question: "Who was the third co-founder of Apple alongside Steve Jobs and Steve Wozniak?",
        answer: "Ronald Wayne",
        sortOrder: 1
    ),
    FlashCard(
        question: "What was the first product Apple ever released?",
        answer: "The Apple I (a motherboard kit)",
        sortOrder: 2
    ),
    FlashCard(
        question: "Which Newton-inspired image was featured in Apple's first official logo?",
        answer: "Isaac Newton sitting under an apple tree",
        sortOrder: 3
    ),
    FlashCard(
        question: "In 1984, Apple introduced the Macintosh with a famous Super Bowl ad. Who directed it?",
        answer: "Ridley Scott",
        sortOrder: 4
    ),
    FlashCard(
        question: "What was the name of the handheld PDA Apple released in 1993?",
        answer: "The Newton MessagePad",
        sortOrder: 5
    ),
    FlashCard(
        question: "What year was the original iPhone announced by Steve Jobs?",
        answer: "2007",
        sortOrder: 6
    ),
    FlashCard(
        question: "What does the 'i' in iMac originally stand for, according to Steve Jobs?",
        answer: "Internet (though it also meant individual, instruct, inform, and inspire)",
        sortOrder: 7
    )
]

@MainActor
let appleTriviaDeck = Deck(
    name: "Apple History & Lore",
    desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
    cards: appleCards,
)


