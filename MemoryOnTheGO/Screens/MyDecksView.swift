//
//  MyDecksView.swift
//  FlashMemory
//
//  Created by Tobias on 1/10/26.
//

import SwiftUI
import SwiftData
import Foundation

struct MyDecksView: View {
    
    @Binding var devMode: Bool
    @State var showNewDeckModal = false
    
    @Environment(\.modelContext) private var context
    @Query(filter: #Predicate<Deck> {deck in deck.deletedAt == nil}, sort: \Deck.sortOrder) private var decks: [Deck]
    
    
    @Query(sort: \Deck.sortOrder) private var allDecks: [Deck]
    
    var numDecks = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(decks) { deck in
                        DeckItemView(deck: deck)
                    }
                }
                .sheet(isPresented: $showNewDeckModal) { NewDeckView() }
                
                if devMode {
                    DevPrintDecksBtn()
                }
                
                AddDeckBtn(showNewDeckModal: $showNewDeckModal).padding()
                
            }
        }
    }
}
    
    


#Preview {
    MyDecksView(devMode: .constant(true))
}
