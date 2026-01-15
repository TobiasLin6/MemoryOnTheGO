//
//  DeckItemView.swift
//  FlashMemory
//
//  Created by Tobias on 1/10/26.
//

import SwiftUI

struct DeckItemView: View {
    @Environment(\.modelContext) private var context
    let deck: Deck

    var body: some View {
        
        NavigationLink {
            FlashcardView(deck: self.deck)
        } label: {
            HStack{
                if let img = deck.img {
                    Image(img)
                } else {
                    Image(systemName: "photo")
                }
                Text(deck.name)
            }
        }
        .swipeActions(edge: .leading) {
            Button {
                moveDeck(deck, to: 0, in: context)
            } label : {
                Label("Pin", systemImage: "pin")
            }
            .tint(.orange)
        }
    
        .swipeActions(edge: .trailing) {
            Button(role: .destructive) {
                softDeleteDeck(deck, from: context)
            } label: {
                Label("Delete", systemImage: "trash")
            }
            
            Button {
                exportDecks([deck], in: context)
            } label: {
                Label("Export", systemImage: "archivebox")
            }
            .tint(.blue)
        }
        
    }
}

#Preview {
    VStack(alignment: .leading, spacing: 12) {
        DeckItemView(deck: appleTriviaDeck)
    }
    .padding()
}
