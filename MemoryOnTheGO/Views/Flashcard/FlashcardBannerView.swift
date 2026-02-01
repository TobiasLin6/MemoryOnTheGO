//
//  FlashcardBannerView.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 2/1/26.
//

import SwiftUI

struct FlashcardBannerView: View {
    let deck: Deck
    
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
                                    .font(.custom(Constants.Fonts.regular, size: 28))
                                    .foregroundColor(Color("main-gray"))
                                    .frame(width: 175, height: 70, alignment: .leading)
                                    .offset(y: 33)
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
                                
                            } label: {
                                Image(systemName: "square.and.pencil")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 23, height: 23)
                            }
                        
                            Button {
                                
                            } label: {
                                Image(systemName: deck.pinned ? "pin.slash" : "pin")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 23, height: 23)
                                    
                            }
                            .padding(.horizontal, 10)
                            Button {
                                
                            } label: {
                                Image(systemName: "trash")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 23, height: 23)
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
    FlashcardBannerView(deck: appleTriviaDeck)
}
