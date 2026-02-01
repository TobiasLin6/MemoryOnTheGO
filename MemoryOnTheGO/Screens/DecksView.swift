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
    @Binding var currentPage: String
    
    @State private var mainOffset: CGFloat = Constants.lowModalOffset
    @State private var dragOffset: CGFloat = 0
    @State private var lockModal: Bool = false
    
    var body: some View {
        ZStack {
            
            // MARK: Background
            DecksModalBackground(currentPage: $currentPage)
            
            // MARK: Content
            ZStack {
                DecksContentView(lockModal: $lockModal, currentPage: $currentPage)
                
                // MARK: Search Bar
            }
        }
        .ignoresSafeArea()
        // MARK: Animations
        .offset(y: mainOffset + dragOffset)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { value in
                    let translation = value.translation.height
                    
                    if !lockModal {
                        if currentPage == "home" {
                            dragOffset = max(-520, min(30, translation))
                        } else {
                            dragOffset = max(-30, min(520, translation))
                        }
                    }
                }
                .onEnded { value in
                    withAnimation(.spring()) {
                        if dragOffset > Constants.dragDismissThreshold {
                            currentPage = "home"
                            mainOffset = Constants.lowModalOffset
                        } else if dragOffset < (-1 * Constants.dragDismissThreshold) {
                            currentPage = "decks"
                            mainOffset = Constants.highModalOffset
                        }
                        dragOffset = 0
                    }
                }
        )
        .onAppear {
            mainOffset = (currentPage == "home") ? Constants.lowModalOffset : Constants.highModalOffset
        }
        .onChange(of: currentPage) { _, newVal in
            mainOffset = (newVal == "home") ? Constants.lowModalOffset : Constants.highModalOffset
        }
        
        
    }
}



#Preview {
    DecksView(currentPage: .constant("home"))
}
