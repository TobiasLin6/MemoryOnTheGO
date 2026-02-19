//
//  DeckFunctions.swift
//  FlashMemory
//
//  Created by Tobias on 1/11/26.
//

import Foundation
import SwiftData

func addDeck(_ newDeck: Deck, to context: ModelContext) {
    let predicate = #Predicate<Deck> { deck in
        deck.deletedAt == nil
    }
    
    var descriptor = FetchDescriptor<Deck>(
        predicate: predicate,
        sortBy: [SortDescriptor(\.sortOrder, order: .reverse)]
    )
    descriptor.fetchLimit = 1
    
    do {
        let results = try context.fetch(descriptor)
        let greatestSortOrder = results.first?.sortOrder ?? 0
        
        newDeck.sortOrder = greatestSortOrder + 1
        context.insert(newDeck)
        
    } catch {
        print("addDeck failed: \(error)")
    }
}


func updateDeck(_ oldDeck: Deck, to newDeck: Deck, in context: ModelContext ) {
    
    oldDeck.name = newDeck.name
    oldDeck.desc = newDeck.desc
    oldDeck.img = newDeck.img
    oldDeck.cards = newDeck.cards
    
    do {
        try context.save()
    } catch {
        print("updateDeck failed: \(error)")
    }
    
}


func softDeleteDeck(_ deck: Deck, from context: ModelContext) {
    if deck.deletedAt == nil {
        deck.deletedAt = Date()
        deck.sortOrder = -1
        
        do {
            try context.save()
        } catch {
            print("softDeleteDeck failed: \(error)")
        }
        
    } else {
        print("softDeleteDeck failed: deck already soft deleted")
    }
}

func restoreDeck(_ deck: Deck, from context: ModelContext) {
    if deck.deletedAt != nil {
        deck.deletedAt = nil
        
        moveDeck(deck, to: 0, in: context)
        
        do {
            try context.save()
        } catch {
            print("restoreDeck failed: \(error)")
        }
        
    } else {
        print("restoreDeck failed: deck already restored")
    }
}

func hardDeleteDeck(_ deck: Deck, from context: ModelContext) {
    let deletedSortOrder = deck.sortOrder
    context.delete(deck)
    
    let predicate = #Predicate<Deck> { deck in
        deck.deletedAt == nil && deck.sortOrder > deletedSortOrder
    }
    
    let descriptor = FetchDescriptor<Deck>(
        predicate: predicate,
        sortBy: [SortDescriptor(\.sortOrder, order: .reverse)]
    )
    
    do {
        let results = try context.fetch(descriptor)
        
        for deck in results {
            deck.sortOrder -= 1
        }
        
    } catch {
        print("hardDeleteDeck failed: \(error)")
    }
    
}

func pinDeck(_ deck: Deck, in context: ModelContext) {
    deck.pinned = true
    moveDeck(deck, to: 0, in: context)
    
    do {
        try context.save()
    } catch {
        print("pinDeck failed: \(error)")
    }
}

func unpinDeck(_ deck: Deck, in context: ModelContext) {
    deck.pinned = false
    
    let predicate = #Predicate<Deck> { deck in
        deck.deletedAt == nil && deck.pinned == true
    }
    
    var descriptor = FetchDescriptor<Deck>(
        predicate: predicate,
        sortBy: [SortDescriptor(\.sortOrder, order: .reverse)]
    )
    descriptor.fetchLimit = 1
    
    do {
        let results = try context.fetch(descriptor)
        let greatestSortOrder = results.first?.sortOrder ?? 0
        moveDeck(deck, to: (greatestSortOrder + 1), in: context)
        
        try context.save()
        
    } catch {
        print("unpinDeck failed: \(error)")
    }

}

func moveDeck(_ deck: Deck, to destination: Int, in context: ModelContext) {
    
    if deck.sortOrder == destination { return }
    
    let currentSortOrder = deck.sortOrder
    deck.sortOrder = destination
    
    var predicate: Predicate<Deck>? = nil
    var shiftRight: Bool? = nil
    
    if destination < currentSortOrder {
        predicate = #Predicate<Deck> { deck in deck.deletedAt == nil && deck.sortOrder < currentSortOrder && deck.sortOrder > destination }
        shiftRight = true
        
    } else if destination > currentSortOrder {
        predicate = #Predicate<Deck> { deck in deck.deletedAt == nil && deck.sortOrder > currentSortOrder && deck.sortOrder < destination }
        shiftRight = false
    }
    
    let descriptor = FetchDescriptor<Deck>( predicate: predicate)
    do {
        let decks: [Deck] = try context.fetch(descriptor)
        
        for deck in decks {
            if shiftRight! {
                deck.sortOrder += 1
            } else {
                deck.sortOrder -= 1
            }
        }
    
    } catch {
        print("moveDeck failed: \(error)")
    }
}

func removeCard(at index: Int, from deck: Deck, in context: ModelContext) {

    let updatedDeck = deck
    var cards = deck.cards.sorted { $0.sortOrder < $1.sortOrder }
    
    guard cards.indices.contains(index) else {
        print("removeCard failed: Index \(index) out of bounds")
        return
    }
    
    let removedCard = cards.remove(at: index)
    
    for (newIndex, card) in cards.enumerated() {
        card.sortOrder = newIndex
    }
    
    context.delete(removedCard)
    
    updatedDeck.cards = cards
    updateDeck(deck, to: updatedDeck, in: context)
}

func seedInitialDecks(context: ModelContext) {
    let descriptor = FetchDescriptor<Deck>()
    let existingCount = (try? context.fetchCount(descriptor)) ?? 0
    
    if existingCount == 0 {
        for deck in DeckConstants.defaultDecks {
            addDeck(deck, to: context)
        }
        
        do {
            try context.save()
        } catch {
            print("Failed to seed decks: \(error)")
        }
    }
}
