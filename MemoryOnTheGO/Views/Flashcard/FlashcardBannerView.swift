//
//  FlashcardBannerView.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 2/1/26.
//

import SwiftUI

struct FlashcardBannerView: View {
    @Environment(\.modelContext) private var context
    @Environment(AppState.self) var appState
    
    let deck: Deck
    @Binding var showCardModal: Bool
    @State private var showingAlert: Bool = false
    
    @Binding var showCreateDeckModal: Bool
    @Binding var bindingDeck: Deck
    @Binding var deckMode: String
    
    var body: some View {
        VStack {
            ZStack {
                Image("DeckBanner")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(5)
                VStack {
                    HStack {
                        if deck.pinned {
                            Image(systemName: "pin")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:15)
                                .foregroundColor(Color("deck-itm-pin"))
                                .padding(21)
                                .padding(.leading, 5)
                            
                        }
                        Spacer()
                    }
                    Spacer()
                }
                
                
                VStack {
                    HStack {
                        VStack(alignment: .leading){
                            VStack (alignment: .leading) {
                                Text(deck.name)
                                    .font(.custom(Constants.Fonts.regular, size: 25))
                                    .foregroundColor(Color("main-gray"))
                                    .frame(width: 175, height: 70, alignment: .leading)
                                    .offset(y: 36)
                                VStack{
                                    Text(deck.desc)
                                        .font(.custom(Constants.Fonts.regular, size: 15))
                                        .foregroundColor(Color("main-gray"))
                                        .frame(width: 225, alignment: .leading)
                                    Spacer()
                                }
                                .frame(height:62)
                                .offset(y:23)
                            }
                            .frame(width: 225)
                        }
                        .padding(.leading, 10)
                        UniversalImageView(source:deck.img)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 135, height: 135)
                            .offset(x: -20, y: -25)
                            .foregroundColor(Color("main-gray"))
                    }
                    HStack{
                        Spacer()
                            Button {
                                bindingDeck = deck
                                deckMode = "edit"
                                showCreateDeckModal = true
                            } label: {
                                Image(systemName: "square.and.pencil")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 23, height: 23)
                            }
                        
                            Button {
                                if deck.pinned {
                                    unpinDeck(deck, in: context)
                                } else {
                                    pinDeck(deck, in: context)
                                }
                            } label: {
                                Image(systemName: deck.pinned ? "pin.slash" : "pin")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 23, height: 23)
                                    
                            }
                            .padding(.horizontal, 10)
                            Button {
                                showingAlert = true
                            } label: {
                                Image(systemName: "trash")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 23, height: 23)
                            }
                            .confirmationDialog(
                                "Are you sure?",
                                isPresented: $showingAlert,
                                titleVisibility: .visible
                            ) {
                                Button("Delete", role: .destructive) {
                                    withAnimation(.easeOut) {
                                        appState.navID = UUID()
                                        }
                                    appState.currentPage = "decks"
                                    softDeleteDeck(deck, from: context)
                                }
                            } message: {
                                Text("You are about to delete this deck.")
                            }
                        
                    }
                    .foregroundColor(Color("main-gray"))
                    .offset(x: -20, y: -15)
                }
            }
        }
    }
}

#Preview {
    FlashcardBannerView(deck: appleTriviaDeck, showCardModal: .constant(true), showCreateDeckModal: .constant(false), bindingDeck: .constant(appleTriviaDeck), deckMode: .constant("edit"))
        .environment(AppState())
}
