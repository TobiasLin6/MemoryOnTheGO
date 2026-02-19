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
    @Environment(AppState.self) var appState
    
    @Binding var lockModal: Bool
    @Binding var currentChoice: String
    @State private var scrollID: ScrollTarget?
    @State private var scrollDisabled: Bool = true
    @Environment(\.modelContext) private var context
    
    @Binding var showDeckModal: Bool
    @Binding var mode: String
    
    @Binding var bindingDeck: Deck
    
    @Binding var filteredDecksList: [Deck]
    @Binding var keyboardHeight: CGFloat
    
    var body: some View {
        ScrollView {
            
            VStack {
                DecksNavigationBar(currentChoice: $currentChoice)
                    .padding(.top, 35)
                    .id(ScrollTarget.top)
                    .scrollPosition(id: $scrollID, anchor: .top)

                ForEach(filteredDecksList) {deck in
                    DeckItemView(deck: deck, bindingDeck: $bindingDeck, showDeckModal: $showDeckModal, mode: $mode)
                        .id(ScrollTarget.deck(deck.id))
                    }
                
                Spacer().frame(height: keyboardHeight > 0 ? 450 : 220)
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
        .onChange(of: appState.currentPage) { _, newValue in
            scrollID = ScrollTarget.top
            scrollDisabled = newValue == "home"
        }
            
            
        }
    }


#Preview {
    DecksContentView(lockModal: .constant(false), currentChoice: .constant("all"), showDeckModal: .constant(false), mode: .constant("add"), bindingDeck: .constant(appleTriviaDeck), filteredDecksList: .constant([]), keyboardHeight: .constant(0))
        .environment(AppState())
}
