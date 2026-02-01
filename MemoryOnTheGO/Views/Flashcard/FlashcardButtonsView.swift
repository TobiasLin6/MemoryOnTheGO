//
//  FlashcardButtonsView.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 2/1/26.
//

import SwiftUI

struct FlashcardButtonsView: View {
    let deck: Deck
    
    var body: some View {
        HStack {
            VStack{
                Button {} label: {
                    Label("Add Card", systemImage: "plus.rectangle.on.rectangle")
                        .font(.custom(Constants.Fonts.regular, size: 18))
                }
                .padding(.bottom, 2)
                Button {} label: {
                    Label("Edit Card", systemImage: "square.and.pencil")
                        .font(.custom(Constants.Fonts.regular, size: 18))
                }
            }
            Spacer()
            Button {} label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(LinearGradient(gradient:
                            Gradient(colors:[Color("mem-palace-bg-light"), Color("mem-palace-bg-dark")]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                                            
                                            )
                              )
                        .frame(width: 215, height: 60)
                    HStack {
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 35, height: 35)
                            .padding(.trailing, 5)
                        Text("Memory Palace")
                            .font(.custom(Constants.Fonts.regular, size: 20))
                    }
                    .padding(.horizontal, 20)
                        
                }
                
            }
        }
        .padding()
        .padding(.top, 10)
        .foregroundColor(Color("main-gray"))
    }
}

#Preview {
    FlashcardButtonsView(deck: appleTriviaDeck)
}
