//
//  HomeView.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 1/15/26.
//

import SwiftUI
import VisualEffectBlurView
import UIKit

struct HomeView: View {
    
    @Binding var currentPage: String
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
            ScrollView {
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
                        .padding(.vertical, 55)
                    }
                    .padding(.horizontal, 30)

                    // MARK: Decks Modal
                    DecksView(currentPage: $currentPage)
                    
                    
                }
                .frame(width: screenWidth, height: screenHeight)
            }
            .ignoresSafeArea()
            .scrollDisabled(true)
        
    }
}

#Preview {
    HomeView(currentPage: .constant("home"))
}
