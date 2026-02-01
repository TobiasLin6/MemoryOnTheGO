//
//  FlashcardView.swift
//  FlashMemory
//
//  Created by Tobias on 1/10/26.
//

import SwiftUI

struct FlashcardView: View {
    
    let deck: Deck
    @State var flashcardIdx: Int = 0
    
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        ZStack {
            
            // MARK: Background
            LinearGradient(colors: [Color("bg-purple-dark"), Color("bg-purple")],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            
            // MARK: Content
            ScrollView {
                //MARK: Banner
                FlashcardBannerView(deck: deck)
                FlashcardButtonsView(deck: deck)
                
                // MARK: Flashcard
                FlashcardCardView(deck: deck, flashcardIdx: $flashcardIdx)
                
                RoundedRectangle(cornerRadius: 1.5)
                    .fill(Color("divider-line"))
                    .frame(height: 3)
                    .padding(.horizontal, 45)
                    .padding(.vertical)
                FlashcardListView(deck: deck, isTextFieldFocused: $isTextFieldFocused)
            }
            // MARK: Toolbar Menu
            .toolbar {
                if #available(iOS 26.0, *) {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button { } label: {
                            Image(systemName: "ellipsis.circle")
                                .foregroundColor(Color("deck-itm-pin"))
                        }
                    }
                    .sharedBackgroundVisibility(.hidden)
                } else {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button { } label: {
                            Image(systemName: "ellipsis.circle")
                                .foregroundColor(Color("deck-itm-pin"))
                        }
                    }
                }
            }
        }
        .onTapGesture {
            isTextFieldFocused = false
        }
        
        
    }
}



#Preview {
    let d = appleTriviaDeck
    return FlashcardView(deck: d)
}

