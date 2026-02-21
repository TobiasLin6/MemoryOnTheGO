//
//  ContentView.swift
//  FlashMemory
//
//  Created by Tobias on 1/10/26.
//

import SwiftUI
import SwiftData

struct MemoryOnTheGO: View {
    
    @Query(filter: #Predicate<Deck> { deck in
        deck.deletedAt == nil
    }, sort: \.sortOrder) private var allDecks: [Deck]
    @State var error: String = ""
    
    @State var devMode: Bool = true
    @State var showNewDeckModal: Bool = false
    
    @Environment(AppState.self) var appState
    
    @Environment(\.modelContext) private var context
    
    @State var mode: String = "add"
    
    @State var bindingDeck: Deck = Deck(name: "New Deck", desc: "This is a new deck")
    @State var randomQuizDeck: Deck = Deck(name: "", desc: "")
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                // MARK: Background
                LinearGradient(colors: [Color("bg-purple-dark"), Color("bg-purple")],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea()
                
                // MARK: Content
                NavigationStack {
                    if appState.currentPage == "home" || appState.currentPage == "decks" {
                        HomeView(showDeckModal: $showNewDeckModal, mode: $mode, bindingDeck: $bindingDeck)
                        
                    } else if appState.currentPage == "quiz" {
                        QuizView(
                            deck: $randomQuizDeck,
                            error: error
                        )
                        .onChange(of: appState.currentPage) { oldPage, newPage in
                            if newPage == "quiz" {
                                runRandomDeckEngine()
                            }
                        }
                        .onChange(of: allDecks, initial: true) {
                            if appState.currentPage == "quiz" {
                                runRandomDeckEngine()
                            }
                        }
                    }
                }
                .id(appState.navID)
                
                // MARK: Tab Bar
                if !appState.hideTabBar{
                    CustomTabBarView(showNewDeckModal: $showNewDeckModal, mode: $mode)
                }
                
                
                ModalBackdrop(toggleModal: $showNewDeckModal)
                if mode == "add" {
                    NewDeckModal(showNewDeckModal: $showNewDeckModal, mode: "add")
                } else {
                    NewDeckModal(deck: bindingDeck, showNewDeckModal: $showNewDeckModal, mode: "edit")
                }
                
                
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea(.keyboard)
        .onAppear() {
            seedInitialDecks(context: context)
        }
        
    }
    
    private func runRandomDeckEngine() {
        let eligibleDecks = allDecks.filter {$0.cards.count >= 4 && $0.deletedAt == nil}

        if let randomDeck = eligibleDecks.randomElement() {
            randomQuizDeck = randomDeck
            error = ""
        } else {
            error = "No valid deck with 4 or more cards."
        }
    }
        
}



#Preview {
    MemoryOnTheGO()
        .environment(AppState())
}
