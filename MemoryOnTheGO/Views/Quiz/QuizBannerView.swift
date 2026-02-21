//
//  QuizBannerView.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 2/19/26.
//

import SwiftUI

struct QuizBannerView: View {
    
    let deck: Deck
    
    var body: some View {
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
                            .frame(width:16)
                            .foregroundColor(Color("deck-itm-pin"))
                            .padding(21)
                            .padding(.top, 21)
                            .padding(.leading, 8)
                        
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

            }
        }
        .frame(height: 200)
    }
}

#Preview {
    QuizBannerView(deck: appleTriviaDeck)
}
