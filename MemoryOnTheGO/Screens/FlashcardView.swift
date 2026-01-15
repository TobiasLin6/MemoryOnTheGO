//
//  FlashcardView.swift
//  FlashMemory
//
//  Created by Tobias on 1/10/26.
//

import SwiftUI

struct FlashcardView: View {
    
    let deck: Deck
    
    var body: some View {
        Text("Flashcard: \(deck.name)")
    }
}

#Preview {
    FlashcardView(deck: appleTriviaDeck)
}

