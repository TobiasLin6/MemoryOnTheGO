//
//  HomeView.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 1/15/26.
//

import SwiftUI
import VisualEffectBlurView

struct HomeView: View {
    
    @Binding var currentPage: String
    @Binding var path: NavigationPath
    
    var body: some View {
        
        ZStack {
            
            // MARK: Background Image
            Image("HomePageSplash")
                .resizable()
                .ignoresSafeArea()
            
            // MARK: Tutorial
            TutorialBtn(currentPage: $currentPage)
            
            // MARK: Settings
            HStack {
                Spacer()
                VStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "gearshape")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .foregroundColor(Color("deck-itm-pin"))
                    }
                    Spacer()
                }
                .padding(.vertical, 35)
            }
            .padding(.horizontal, 30)

            // MARK: Decks Modal
            DecksView(currentPage: $currentPage, path: $path)
            
            
        }
    }
}

#Preview {
    HomeView(currentPage: .constant("home"), path: .constant(NavigationPath()))
}
