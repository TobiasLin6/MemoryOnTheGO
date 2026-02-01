//
//  FlashcardListCard.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 2/1/26.
//

import SwiftUI

struct FlashcardListCard: View {
    let card: FlashCard
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color("card-bg"))
                .stroke(Color("card-outline"), lineWidth: 2)
            
            VStack {
                HStack {
                    Spacer()
                    Button{} label: {
                        Label("Edit Card", systemImage: "square.and.pencil")
                            .font(.custom(Constants.Fonts.regular, size: 16))
                            .foregroundColor(Color("main-gray"))
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical, 12)
            
            
            VStack {
                Button {} label: {
                    UniversalImageView(source: card.img)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 75, height: 75)
                        .foregroundColor(Color("main-gray"))
                        .padding(.top, 5)
                }
                
                Button {} label: {
                    Label("Play Audio", systemImage: "speaker.wave.3")
                        .foregroundColor(Color(white: 0.8))
                    
                }
                .padding(.bottom, 10)
                Text(card.question)
                    .font(.custom(Constants.Fonts.regular, size: 22))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 5)
                    .foregroundColor(.white)
                Text(card.answer)
                    .font(.custom(Constants.Fonts.regular, size: 18))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(white:0.85))
                
                HStack {
                    ForEach(1..<6) { idx in
                        Image(systemName: card.skill >= idx ? "star.fill" : "star")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color("star-yellow"))
                    }
                }
            }
            .padding()
            .padding(.vertical)
            
            VStack {
                Spacer()
                Button {} label: {
                    ZStack {
                        Circle()
                            .fill(.white)
                            .frame(width: 40, height: 40)
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .fontWeight(.bold)
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color("add-card-plus"))
                            .shadow(radius: 3)
                           
                    }
                }
                
            }
            .offset(y: 20)
            
        }
    }
}

#Preview {
    FlashcardListCard(card: appleCards[0])
}
