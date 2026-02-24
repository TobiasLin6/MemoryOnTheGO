//
//  FlashcardView.swift
//  FlashMemory
//
//  Created by Tobias on 1/10/26.
//

import SwiftUI
import SwiftData

struct FlashcardView: View {
    
    @Environment(\.modelContext) var context
    @Environment(AppState.self) var appState
    
    @State var deck: Deck
    @State var flashcardIdx: Int = 0
    @State var showCardModal = false
    @FocusState private var isTextFieldFocused: Bool
    
    var sortedCards: [FlashCard] {
        deck.cards.sorted { $0.sortOrder < $1.sortOrder }
    }
    
    @State var mode = "add"
    
    @State var question = ""
    @State var answer = ""
    @State var img = UniversalImage.symbol("photo")
    
    @State var listIdx = 0
    
    @Binding var showCreateDeckModal: Bool
    @Binding var bindingDeck: Deck
    @Binding var deckMode: String
    
    @State var showMemoryPalaceModal: Bool = false
    @State var photo: UniversalImage = UniversalImage.symbol("photo")
    @State var photoTmp: UniversalImage = UniversalImage.symbol("photo")
    
    @State var showQuizView: Bool = false
    @State var btnDisabled: Bool = false
    
    var body: some View {
        ZStack {
            
            // MARK: Background
            LinearGradient(colors: [Color("bg-purple-dark"), Color("bg-purple")],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            
            // MARK: Content
            ScrollView {
                //MARK: Banner
                Spacer()
                    .frame(height: 75)
                ZStack {
                    FlashcardBannerView(deck: deck, showCardModal: $showCardModal, showCreateDeckModal: $showCreateDeckModal, bindingDeck: $bindingDeck, deckMode: $deckMode)
                    VStack {
                        Spacer()
                        HStack {

                            NavigationLink {
                                QuizView(deck: $deck, isPopQuiz: false)
                            } label: {
                                Label("Take Quiz", systemImage: "questionmark.message")
                                    .font(.custom(Constants.Fonts.regular, size: 18))
                                    .foregroundColor(Color("main-gray"))
                            }
                            Spacer()
                        }
                        .padding()
                    }
                    .offset(y: 40)
                    
                }
                Spacer()
                    .frame(height: 20)
                FlashcardButtonsView(deck: deck, showCardModal: $showCardModal, mode: $mode, showMemoryPalaceModal: $showMemoryPalaceModal, btnDisabled: $btnDisabled)
                
                // MARK: Flashcard
                FlashcardCardView(deck: deck, flashcardIdx: $flashcardIdx, showAddCard: $showCardModal, mode: $mode)
                    .id(deck.cards.count)
                
                RoundedRectangle(cornerRadius: 1.5)
                    .fill(Color("divider-line"))
                    .frame(height: 3)
                    .padding(.horizontal, 45)
                    .padding(.vertical)
                FlashcardListView(deck: deck, isTextFieldFocused: $isTextFieldFocused, showCardModal: $showCardModal, mode: $mode, listIdx: $listIdx)
                    .id(deck.cards.count)
            }
            .onChange(of: flashcardIdx) { _, newIdx in
                if newIdx < deck.cards.count {
                    btnDisabled = false
                    question = sortedCards[newIdx].question
                    answer = sortedCards[newIdx].answer
                    img = sortedCards[newIdx].img
                    
                    photoTmp = img
                } else {
                    btnDisabled = true
                }
            }
            .onAppear() {
                if flashcardIdx < deck.cards.count {
                    btnDisabled = false
                    question = sortedCards[flashcardIdx].question
                    answer = sortedCards[flashcardIdx].answer
                    img = sortedCards[flashcardIdx].img
                    
                    photoTmp = img
                } else {
                    btnDisabled = true
                }
            }
            
            ModalBackdrop(toggleModal: $showCardModal)
            if mode == "edit" {
                CardModal(showCardModal: $showCardModal, deck: $deck,  mode: mode, questionDefault: question, answerDefault: answer, imgDefault: img, idx: flashcardIdx)
            } else if mode == "add-list" {
                CardModal(showCardModal: $showCardModal, deck: $deck, mode: "add", questionDefault: "", answerDefault: "", imgDefault: UniversalImage.symbol("photo"), idx: listIdx)
            } else if mode == "edit-list" {
                CardModal(showCardModal: $showCardModal, deck: $deck, mode: "edit", questionDefault: sortedCards[listIdx].question, answerDefault: sortedCards[listIdx].answer, imgDefault: sortedCards[listIdx].img, idx: listIdx)
            } else {
                CardModal(showCardModal: $showCardModal, deck: $deck, mode: mode, questionDefault: "", answerDefault: "", imgDefault: UniversalImage.symbol("photo"), idx: flashcardIdx)
            }
            
            ModalBackdrop(toggleModal: $showMemoryPalaceModal)
            .onTapGesture {
                isTextFieldFocused = false
            }
            UploadPhotoModal(showPhotoModal: $showMemoryPalaceModal, photo: $photo, setPhotoTmp: $photoTmp, mode: "memory-palace")
                .onChange(of: photo) {
                    sortedCards[flashcardIdx].img = photo
                    photoTmp = photo
                    do {
                        try context.save()
                        
                    } catch {
                        print("edit card failed: \(error)")
                    }
                }
                .onChange(of: showMemoryPalaceModal) {
                    appState.hideTabBar = showMemoryPalaceModal
                }
                .onAppear() {
                    if sortedCards.count > 0 {
                        photoTmp = sortedCards[0].img
                    }
                }
            
        }
        .onChange(of: showCardModal) { _, newVal in
            appState.hideTabBar = showCardModal
        }
        
        
    }
}



#Preview {
    FlashcardView(deck: appleTriviaDeck, showCreateDeckModal: .constant(false), bindingDeck: .constant(appleTriviaDeck), deckMode: .constant("edit"))
        .environment(AppState())
}

