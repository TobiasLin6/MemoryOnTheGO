//
//  ContentView.swift
//  FlashMemory
//
//  Created by Tobias on 1/10/26.
//

import SwiftUI

struct MemoryOnTheGO: View {
    
    @State var devMode: Bool = true
    @State var showNewDeckModal: Bool = false
    @State var tutorialStage: Int = -1  // -1 = tutorial not enabled
    
    @Environment(AppState.self) var appState
    @Environment(\.modelContext) var context
    
    @State var mode: String = "add"
    
    @State var bindingDeck: Deck = Deck(name: "New Deck", desc: "This is a new deck")
    
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
                        
                    } else if appState.currentPage == "about" {
                        AboutView()
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
        
    }
        
}

#Preview {
    MemoryOnTheGO()
        .environment(AppState())
}
