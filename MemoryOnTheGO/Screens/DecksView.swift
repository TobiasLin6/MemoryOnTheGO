//
//  MyDecksView.swift
//  FlashMemory
//
//  Created by Tobias on 1/10/26.
//

import SwiftUI
import SwiftData
import VisualEffectBlurView

struct DecksView: View {
    @Environment(AppState.self) var appState
    
    @State private var mainOffset: CGFloat = Constants.lowModalOffset
    @State private var dragOffset: CGFloat = 0
    @State private var lockModal: Bool = false
    
    @Binding var showDeckModal: Bool
    @Binding var mode: String
    
    @Binding var bindingDeck: Deck
    
    @FocusState.Binding var focused: Bool
    @State private var currentKeyboardHeight: CGFloat = 0
    
    @Query(filter: #Predicate<Deck> { deck in
        deck.deletedAt == nil
    }, sort: \.sortOrder) private var allDecks: [Deck]
    @Query(filter: #Predicate<Deck> { deck in
        deck.deletedAt == nil && deck.pinned == true
    }, sort: \.sortOrder) private var pinnedDecks: [Deck]
    
    @State var contentMode: String = "all"  // "all", "pinned"
 
    @State var decksList: [Deck] = []
    @State var filteredDecksList: [Deck] = []
    
    var body: some View {
        ZStack {
            
            // MARK: Background
            DecksModalBackground()
                .onTapGesture() {
                    focused = false
                }
            
            // MARK: Content
            DecksContentView(lockModal: $lockModal, currentChoice: $contentMode, showDeckModal: $showDeckModal, mode: $mode, bindingDeck: $bindingDeck, filteredDecksList: $filteredDecksList, keyboardHeight: $currentKeyboardHeight)
            
            // MARK: Search Bar
            VStack {
                Spacer()
                DeckSearchBar(items: decksList, filteredItems: $filteredDecksList, isTextFieldFocused: $focused)
                    .padding()
                    .padding(.bottom, currentKeyboardHeight > 0 ? 70 : 170)
            }
            .offset(y: -currentKeyboardHeight)
            .keyboardHeight($currentKeyboardHeight)
        }
        .onChange(of: contentMode) { _, newVal in
            if newVal == "pinned" {
                decksList = pinnedDecks
            } else {
                decksList = allDecks
            }
        }
        .onChange(of: allDecks) { _, newVal in
            contentMode = "all"
            decksList = newVal
        }
        .onChange(of: decksList) {_, newVal in
            filteredDecksList = decksList
        }
        .ignoresSafeArea()
        // MARK: Animations
        .offset(y: mainOffset + dragOffset)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { value in
                    let translation = value.translation.height
                    
                    if !lockModal {
                        if appState.currentPage == "home" {
                            dragOffset = max(-520, min(30, translation))
                        } else {
                            dragOffset = max(-30, min(520, translation))
                        }
                    }
                }
                .onEnded { value in
                    withAnimation(.spring()) {
                        if dragOffset > Constants.dragDismissThreshold {
                            appState.currentPage = "home"
                            focused = false
                            mainOffset = Constants.lowModalOffset
                        } else if dragOffset < (-1 * Constants.dragDismissThreshold) {
                            appState.currentPage = "decks"
                            mainOffset = Constants.highModalOffset
                        }
                        dragOffset = 0
                    }
                }
        )
        .onAppear {
            decksList = allDecks
            filteredDecksList = decksList
            mainOffset = (appState.currentPage == "home") ? Constants.lowModalOffset : Constants.highModalOffset
        }
        .onChange(of: appState.currentPage) { _, newVal in
            mainOffset = (newVal == "home") ? Constants.lowModalOffset : Constants.highModalOffset
        }
        
        
    }
}



#Preview {
    @FocusState var focused: Bool
    DecksView(showDeckModal: .constant(false), mode: .constant("add"), bindingDeck: .constant(appleTriviaDeck), focused: $focused)
        .environment(AppState())
}
