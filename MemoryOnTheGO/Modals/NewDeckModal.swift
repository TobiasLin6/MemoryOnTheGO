//
//  NewDeckModal.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 1/24/26.
//

import SwiftUI

struct NewDeckModal: View {
    @Environment(\.modelContext) private var context
    
    @Binding var showNewDeckModal: Bool
    
    @State private var nameCharacters = 0
    @State private var deckName = ""
    @State private var deckDesc = ""
    @State private var deckImg = UniversalImage.symbol("photo")
    
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
                    
                    DefaultModalBackground(height: Constants.createDeckModalHeight)
                        .onTapGesture {
                            isInputActive = false
                        }
                    
                    
                    VStack {
                        HStack (alignment: .center) {
                            ModalTitle(title: "Create Deck")
                                .offset(x: 35)
                            Spacer()
                            CloseBtn(action: {showNewDeckModal = false})
                                .padding(.trailing, 10)
                        }
                        
                        ModalTextField(
                            label: "Deck Name",
                            maxChars: Constants.deckNameMaxChars,
                            height: 1,
                            text: $deckName)
                        .focused($isInputActive)
                        ModalTextField(
                            label: "Deck Description",
                            maxChars: Constants.deckDescMaxChars,
                            height: 3,
                            text: $deckDesc)
                        .focused($isInputActive)
                        
                        UniversalImageView(source: deckImg)
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 150)
                            .foregroundColor(Color("main-gray"))
                            .padding(.bottom, 10)
                            .padding(.top, 20)
                        GhostBtn(title: "Change Photo") {showPhotoModal = true}
                            .padding(.bottom, 20)
                        SubmitBtn(title: "Create Deck") {
                            
                            let newDeck = Deck(
                                name: deckName == "" ? "New Deck" : deckName,
                                desc: deckDesc == "" ? "This is a new deck." : deckDesc,
                                img: deckImg,
                                cards: appleCards
                            )
                            
                            addDeck(newDeck, to: context)
                            showNewDeckModal = false
                        }
                            .padding(.bottom, 30)
                    }
                    .padding(.horizontal, 20)
                }
            }
            .ignoresSafeArea()
            
            ModalBackdrop(toggleModal: $showPhotoModal)
            UploadPhotoModal(showPhotoModal: $showPhotoModal, photo: $deckImg)
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
                        showNewDeckModal = false
                    }
                    gestureOffset = 0
                }
            }
        )
        .offset(y: mainOffset + gestureOffset)
        .onAppear {
            withAnimation(.spring()){
                mainOffset = showNewDeckModal ? 15.0 : 1000
            }
        }
        .onChange(of:showNewDeckModal){ _, newVal in
            withAnimation(.spring()) {
                mainOffset = newVal ? 15.0 : 1000
            }
            if !newVal {
                isInputActive = false
            }
            deckName = ""
            deckDesc = ""
            deckImg = UniversalImage.symbol("photo")
        }
        .ignoresSafeArea()
        
        
    }
}

#Preview {
    NewDeckModal(showNewDeckModal: .constant(true))
}


