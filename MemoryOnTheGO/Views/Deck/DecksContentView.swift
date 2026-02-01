//
//  DecksContent.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 1/16/26.
//

import SwiftUI
import SwiftData

enum ScrollTarget: Hashable {
    case top
    case deck(Deck.ID)
    case bottom
}

struct DecksContentView: View {
    
    @Binding var lockModal: Bool
    @Binding var currentPage: String
    @State var currentChoice: String = "all"
    @State private var scrollID: ScrollTarget?
    @State private var scrollDisabled: Bool = true
    @Environment(\.modelContext) private var context
    
    @Query(filter: #Predicate<Deck> { deck in
        deck.deletedAt == nil
    }, sort: \.sortOrder) private var allDecks: [Deck]
    @Query(filter: #Predicate<Deck> { deck in
        deck.deletedAt == nil && deck.pinned == true
    }, sort: \.sortOrder) private var pinnedDecks: [Deck]
    
    var body: some View {
        ScrollView {
            
            VStack {
                DecksNavigationBar(currentChoice: $currentChoice)
                    .padding(.top, 35)
                    .id(ScrollTarget.top)
                    .scrollPosition(id: $scrollID, anchor: .top)
                // TODO: Add content
                ForEach(currentChoice == "pinned" ? pinnedDecks: allDecks) {deck in
                    DeckItemView(deck: deck)
                        .id(ScrollTarget.deck(deck.id))
                    }
                
                Spacer().frame(height: 160)
                    .id(ScrollTarget.bottom)
                }
            .scrollTargetLayout()
            .ignoresSafeArea()
        }
        .frame(height: 825)
        .padding(.vertical, 20)
        .padding(.horizontal, 10)
        .scrollDisabled(scrollDisabled)
        .scrollPosition(id: $scrollID)
        .onChange(of: scrollID) { _, newValue in
            lockModal = newValue != ScrollTarget.top
        }
        .onChange(of: currentPage) { _, newValue in
            scrollID = ScrollTarget.top
            scrollDisabled = newValue == "home"
        }
            
            
        }
    }


#Preview {
    DecksContentView(lockModal: .constant(false), currentPage: .constant("home"))
}
