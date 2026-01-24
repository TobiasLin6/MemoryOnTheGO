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
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path){
            ZStack {
                // MARK: Background
                LinearGradient(colors: [Color("bg-purple-dark"), Color("bg-purple")],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea()
                
                // MARK: Content
                Group {
                    if currentPage == "home" || currentPage == "decks" {
                        HomeView(currentPage: $currentPage, path: $path)
                        
                    } else if currentPage == "about" {
                        AboutView()
                    }
                }
                
                //MARK: Tab Bar
                CustomTabBarView(currentPage: $currentPage, showNewDeckModal: $showNewDeckModal)
                
                    
                
            }
        }
    }
        
}

#Preview {
    MemoryOnTheGO()
}
