//
//  ContentView.swift
//  FlashMemory
//
//  Created by Tobias on 1/10/26.
//

import SwiftUI

struct MemoryOnTheGO: View {
    
    @State var devMode: Bool = true
    @State var currentPage: String = "home"
    @State var showNewDeckModal: Bool = false
    @State var tutorialStage: Int = -1  // -1 = tutorial not enabled
    
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                // MARK: Background
                LinearGradient(colors: [Color("bg-purple-dark"), Color("bg-purple")],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                
                // MARK: Content
                
                NavigationStack {
                    if currentPage == "home" || currentPage == "decks" {
                        HomeView(currentPage: $currentPage)
                        
                    } else if currentPage == "about" {
                        AboutView()
                    }
                }
                
                // MARK: Tab Bar
                CustomTabBarView(currentPage: $currentPage, showNewDeckModal: $showNewDeckModal)
                
                ModalBackdrop(toggleModal: $showNewDeckModal)
                NewDeckModal(showNewDeckModal: $showNewDeckModal)
                
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea(.keyboard)
    }
        
}

#Preview {
    MemoryOnTheGO()
}
