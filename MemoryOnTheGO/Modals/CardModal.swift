//
//  CardModal.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 2/2/26.
//

import SwiftUI
import SwiftData

struct CardModal: View {
    @Environment(\.modelContext) private var context
    
    @Binding var showCardModal: Bool
    @Binding var deck: Deck
    let mode: String  // "add" or "edit"
    
    @State var nameCharacters = 0
    let questionDefault: String
    let answerDefault: String
    let imgDefault: UniversalImage
    let idx: Int
    
    @State var question = ""
    @State var answer = ""
    @State var img = UniversalImage.symbol("photo")
    
    @State var sortedCards: [FlashCard] = []
    
    @State private var mainOffset: CGFloat = 1000
    @State private var gestureOffset: CGFloat = 0
    
    @State private var photoModalBgOpacity: CGFloat = 0
    @State var showPhotoModal: Bool = false
    
    @FocusState private var isInputActive: Bool
    
    var body: some View {
        
        ZStack {
            
            VStack {
                Spacer()
                ZStack {
                    
                    DefaultModalBackground(height: Constants.createCardModalHeight)
                        .onTapGesture {
                            isInputActive = false
                        }
                    
                    
                    VStack {
                        HStack (alignment: .center) {
                            ModalTitle(title: mode == "add" ? "Create Card" : "Edit Card")
                                .offset(x: 35)
                            Spacer()
                            CloseBtn(action: {showCardModal = false})
                                .padding(.trailing, 10)
                        }
                        
                        ModalTextField(
                            label: "Question",
                            maxChars: Constants.cardQuestionMaxChars,
                            height: 3,
                            text: $question)
                        .focused($isInputActive)
                        ModalTextField(
                            label: "Answer",
                            maxChars: Constants.cardAnswerMaxChars,
                            height: 3,
                            text: $answer)
                        .focused($isInputActive)
                        
                        UniversalImageView(source: img)
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 150)
                            .foregroundColor(Color("main-gray"))
                            .padding(.bottom, 10)
                            .padding(.top, 20)
                        GhostBtn(title: "Change Photo") {showPhotoModal = true}
                            .padding(.bottom, 20)
                        SubmitBtn(title: mode == "add" ? "Create Card" : "Confirm Edit") {
                            if mode == "add" {
                                let newSortOrder = idx + 1
                                
                                for card in deck.cards {
                                    if card.sortOrder >= newSortOrder {
                                        card.sortOrder += 1
                                    }
                                }
                                
                                let newCard = FlashCard(question: question, answer: answer, img: img, sortOrder: newSortOrder)
                                deck.cards.append(newCard)
                                
                                do {
                                    try context.save()
                                } catch {
                                    print("add card failed: \(error)")
                                }
                                
                            } else {

                                if idx < deck.cards.count {
                                    let cardToEdit = sortedCards[idx]
                                    cardToEdit.question = question
                                    cardToEdit.answer = answer
                                    cardToEdit.img = img
                                    
                                    do {
                                        try context.save()
                                    } catch {
                                        print("edit card failed: \(error)")
                                    }
                                }
                            }
                            showCardModal = false
                        }
                            .padding(.bottom, 60)
                    }
                    .padding(.horizontal, 20)
                }
            }
            .ignoresSafeArea()
            
            ModalBackdrop(toggleModal: $showPhotoModal)
            UploadPhotoModal(showPhotoModal: $showPhotoModal, photo: $img, setPhotoTmp: .constant(UniversalImage.symbol("photo")))
        }
        .gesture(DragGesture(coordinateSpace: .global)
            .onChanged { value in
                if mainOffset < 50 && value.translation.height > -10 {
                    gestureOffset = value.translation.height
                }
            }
            .onEnded { value in
                withAnimation(.spring()) {
                    if gestureOffset > 150 {
                        showCardModal = false
                    }
                    gestureOffset = 0
                }
            }
        )
        .offset(y: mainOffset + gestureOffset)
        .onAppear {
            withAnimation(.spring()){
                mainOffset = showCardModal ? 15.0 : 1000
            }

        }
        .onChange(of:showCardModal){ _, newVal in
            withAnimation(.spring()) {
                mainOffset = newVal ? 15.0 : 1000
            }
            if !newVal {
                isInputActive = false
            }
            question = questionDefault
            answer = answerDefault
            img = imgDefault
        }
        .ignoresSafeArea()
        .onAppear {
            question = questionDefault
            answer = answerDefault
            img = imgDefault
            sortedCards = deck.cards.sorted { $0.sortOrder < $1.sortOrder }
        }
        
        
    }
}

#Preview {
    CardModal(showCardModal: .constant(true), deck: .constant(appleTriviaDeck), mode:"add", questionDefault: "", answerDefault: "", imgDefault: UniversalImage.symbol("photo"), idx: 0)
}
