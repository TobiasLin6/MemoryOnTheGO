//
//  DecksContent.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 1/16/26.
//

import SwiftUI

enum ScrollTarget: Hashable {
    case top
    case deck(Deck.ID)
    case bottom
}

struct DecksContentView: View {
    
    @Binding var lockModal: Bool
    @Binding var path: NavigationPath
    @Binding var currentPage: String
    @State var currentChoice: String = "all"
    @State private var scrollID: ScrollTarget?
    @State private var scrollDisabled: Bool = true
    
    private let allDecks = [
        appleTriviaDeck,
        appleTriviaDeck2,
        appleTriviaDeck3,
        appleTriviaDeck4,
        Deck(
            name: "Apple History & Lore4",
            desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
            cards: appleCards,
        ),
        Deck(
            name: "Apple History & Lore4",
            desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
            cards: appleCards,
        ),
        Deck(
            name: "Apple History & Lore4",
            desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
            cards: appleCards,
        ),
        Deck(
            name: "Apple History & Lore4",
            desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
            cards: appleCards,
        ),
        Deck(
            name: "Apple History & Lore4",
            desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
            cards: appleCards,
        ),
        Deck(
            name: "Apple History & Lore4",
            desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
            cards: appleCards,
        ),
        Deck(
            name: "Apple History & Lore4",
            desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
            cards: appleCards,
        ),
        Deck(
            name: "Apple History & Lore4",
            desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
            cards: appleCards,
        )
    ]
    
    var body: some View {
        ScrollView {
            
            VStack {
                DecksNavigationBar(currentChoice: $currentChoice)
                    .padding(.top, 35)
                    .id(ScrollTarget.top)
                    .scrollPosition(id: $scrollID, anchor: .top)
                // TODO: Add content
                ForEach(allDecks) {deck in
                    DeckItemView(deck: deck)
                        .id(ScrollTarget.deck(deck.id))
                        .onTapGesture {
                            path.append(deck)
                        }
                    }
                
                Spacer().frame(height: 160)
                    .id(ScrollTarget.bottom)
                }
            .scrollTargetLayout()
            
            
            }
        .padding(.vertical, 20)
        .padding(.horizontal, 10)
        .scrollDisabled(scrollDisabled)
        .scrollPosition(id: $scrollID)
        .onChange(of: scrollID) { _, newValue in
            lockModal = newValue != ScrollTarget.top
            print("Current visible item ID: \(newValue!)")
        }
        .onChange(of: currentPage) { _, newValue in
            scrollID = ScrollTarget.top
            scrollDisabled = newValue == "home"
            print(scrollDisabled)
        }
            
            
        }
    }


#Preview {
    DecksContentView(lockModal: .constant(false), path: .constant(NavigationPath()), currentPage: .constant("home"))
}
