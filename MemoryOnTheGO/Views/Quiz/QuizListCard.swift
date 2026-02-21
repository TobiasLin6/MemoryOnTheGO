//
//  QuizListCard.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 2/21/26.
//

//
//  FlashcardListCard.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 2/1/26.
//

import SwiftUI

struct QuizListCard: View {
    let card: FlashCard
    let correct: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(correct ? "correct-card-bg" : "incorrect-card-bg"))
                .stroke(Color(correct ? "correct-card-outline" : "incorrect-card-outline"), lineWidth: 2)
            
            VStack {
                UniversalImageView(source: card.img)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 75, height: 75)
                    .foregroundColor(Color("main-gray"))
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
            
        }
    }
}

#Preview {
    QuizListCard(card: appleCards[0], correct: false)
}
