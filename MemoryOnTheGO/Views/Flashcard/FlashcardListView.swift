//
//  FlashcardListView.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 2/1/26.
//

import SwiftUI

struct FlashcardListView: View {
    @State var deck: Deck
    @State var filteredCards: [FlashCard] = []
    
    @FocusState.Binding var isTextFieldFocused: Bool
    @State var sortedFilteredCards: [FlashCard] = []
    
    @Binding var showCardModal: Bool
    @Binding var mode: String
    @Binding var listIdx: Int
    
    var body: some View {
        VStack {
            HStack {
                Text("All Flashcards")
                    .foregroundColor(.white)
                    .font(.custom(Constants.Fonts.regular, size: 23))
                Spacer()
                Text("\(deck.cards.count) Cards")
                    .foregroundColor(Color("main-gray"))
                    .font(.custom(Constants.Fonts.regular, size: 16))
            }
            FlashcardSearchBar(items: deck.cards, filteredItems: $filteredCards, isTextFieldFocused: $isTextFieldFocused)
                .padding(.top, -5)
                .padding(.bottom, 20)
            
            ForEach(sortedFilteredCards.indices, id: \.self) { i in
                FlashcardListCard(
                    card: sortedFilteredCards[i],
                    deck: $deck,
                    showCardModal: $showCardModal,
                    mode: $mode,
                    listIdx: $listIdx,
                    idx: i
                )
                .padding(.bottom, 35)
            }

            Spacer()
                .frame(height: 130)
        }
        .padding(.horizontal, 30)
        .onAppear() {
            filteredCards = deck.cards
        }
        .onChange(of: filteredCards) { _, cards in
            sortedFilteredCards = cards.sorted { $0.sortOrder < $1.sortOrder }
        }
    }
}

#Preview {
    @FocusState var focused: Bool
    FlashcardListView(deck: appleTriviaDeck, isTextFieldFocused: $focused, showCardModal: .constant(false), mode:.constant("add-list"), listIdx: .constant(0))
}
