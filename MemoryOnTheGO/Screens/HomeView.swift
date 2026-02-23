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
    @FocusState var focused: Bool
    
    @Environment(AppState.self) var appState
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    @Binding var showDeckModal: Bool
    @Binding var mode: String

    @Binding var bindingDeck: Deck
    
    @State var showCaseStudy: Bool = false
    
    var body: some View {
            ScrollView {
                ZStack {
                    
                    // MARK: Background Image
                    Image("HomePageSplash")
                        .resizable()
                        .ignoresSafeArea()
                    
                    // MARK: Tutorial
                    CaseStudyBtn(showCaseStudy: $showCaseStudy)

                    // MARK: Decks Modal
                    DecksView(showDeckModal: $showDeckModal, mode: $mode, bindingDeck: $bindingDeck, focused: $focused)
                    
                    ModalBackdrop(toggleModal: $showCaseStudy)
                    CaseStudyModal(showCaseStudy: $showCaseStudy)
                        .opacity(showCaseStudy ? 1.0 : 0.0)
                        .animation(.easeInOut(duration: 0.25), value: showCaseStudy)
                        .onChange(of: AppState().currentPage) {
                            showCaseStudy = false
                        }
                }
                .frame(width: screenWidth, height: screenHeight)
                .onTapGesture() {
                    focused = false
                }
            }
            .ignoresSafeArea()
            .scrollDisabled(true)
        
    }
}

#Preview {
    HomeView(showDeckModal: .constant(false), mode: .constant("add"), bindingDeck: .constant(appleTriviaDeck))
        .environment(AppState())
}
