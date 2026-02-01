//
//  FlashcardListView.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 2/1/26.
//

import SwiftUI

struct FlashcardListView: View {
    let deck: Deck
    @State var filteredCards: [FlashCard] = []
    
    @FocusState.Binding var isTextFieldFocused: Bool
    
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
            
            ForEach(filteredCards) { card in
                FlashcardListCard(card: card)
                    .padding(.bottom, 35)
            }

            Spacer()
                .frame(height: 55)
        }
        .padding(.horizontal, 30)
        .onAppear() {
            filteredCards = deck.cards
        }
    }
}

#Preview {
    @FocusState var focused: Bool
    FlashcardListView(deck: appleTriviaDeck, isTextFieldFocused: $focused)
}
