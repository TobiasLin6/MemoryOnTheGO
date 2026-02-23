//
//  QuizCompleteView.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 2/21/26.
//

import SwiftUI

struct QuizCompleteView: View {
    let deck: Deck
    let score: Int
    @State var correctQuestions: [Bool]
    let restart: () -> Void
    let isPopQuiz: Bool
    
    var body: some View {
        VStack {
            Image(systemName: "book.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 55)
                .padding(.top, 20)
            Text("Quiz Complete!")
                .multilineTextAlignment(.center)
                .font(.custom(Constants.Fonts.regular, size: 34))
                .foregroundColor(Color("main-gray"))
            Text("Score: \(score) / \(deck.cards.count)")
                .multilineTextAlignment(.center)
                .font(.custom(Constants.Fonts.regular, size: 22))
                .foregroundColor(Color("main-gray"))
                .padding(.bottom, 5)
            Button {
                restart()
            } label: {
                RoundedRectangle(cornerRadius: 50)
                    .fill(Color("home-modal-1"))
                    .frame(width: 140, height: 35)
                    .overlay (
                        Text("Restart Quiz")
                            .font(.custom(Constants.Fonts.regular, size: 18))
                            .foregroundColor(Color("main-gray"))
                    )
                    .shadow(radius: 3)
            }
            .padding(.bottom, 15)
            
            HStack {
                Text("Results: ")
                    .font(.custom(Constants.Fonts.regular, size: 20))
                    .foregroundColor(Color("main-dark-gray"))
                    .padding(.horizontal, 30)
                Spacer()
            }
            .padding(.bottom, 3)
            
            ScrollView() {
                Spacer()
                    .frame(height: 8)
                ForEach(0..<deck.cards.count, id: \.self) { idx in
                    let isCorrect = correctQuestions.indices.contains(idx) ? correctQuestions[idx] : false
                    
                    QuizListCard(card: deck.cards[idx], correct: isCorrect)
                        .padding(.bottom, 16)
                        .padding(.horizontal, 30)
                }
                Spacer()
                    .frame(height: 55)
            }
            
            .cornerRadius(12)
        }
        .offset(y: isPopQuiz ? 10 : -40)
        

    }
    
}


#Preview {
    QuizCompleteView(
        deck: appleTriviaDeck,
        score: 5,
        correctQuestions: [true, true, false, false, false, true, true, true],
        restart: {},
        isPopQuiz: true
    )
}
