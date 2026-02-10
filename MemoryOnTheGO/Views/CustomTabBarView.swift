//
//  CustomTabBarView.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 1/15/26.
//

import SwiftUI
import VisualEffectBlurView

struct CustomTabBarView: View {
   
    @Binding var showNewDeckModal: Bool
    @Environment(AppState.self) var appState
    @Binding var mode: String
    
    var body: some View {
        VStack {
            Spacer()
            ZStack{
                
                VisualEffectBlur(
                    blurEffectStyle: .constant(.systemUltraThinMaterialDark),
                    blurRadius: .constant(8)
                )
                .mask {
                    Image("TabBarMask")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
            
                Image("TabBar")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                
                
                HStack {
                    Button {
                        withAnimation(.easeOut) {
                            appState.navID = UUID()
                            }
                        appState.currentPage = "decks"
                    } label: {Label("Decks", systemImage: "rectangle.stack")}
                    
                    Spacer()
                    
                    Button {
                        withAnimation(.easeOut) {
                            appState.navID = UUID()
                            }
                        appState.currentPage = "about"
                    } label: {Label("About", systemImage: "questionmark.circle")}
                }
                .foregroundColor(Color("main-gray"))
                .padding(25)
                .offset(y: 10)
                
                Button {
                    mode = "add"
                    showNewDeckModal = true
                } label: {
                    Image("TabBar-Button")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70)
                    
                }
                
            }.frame(height: 100)
            
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    CustomTabBarView(showNewDeckModal: .constant(false), mode: .constant("add"))
        .environment(AppState())
}
