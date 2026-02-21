//
//  QuizView.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 2/19/26.
//

import SwiftUI

struct QuizView: View {
    @Binding var deck: Deck
    
    @State private var currentIdx = 0
    @State private var options: [String] = []
    @State private var selectedAnswer: String? = nil
    @State var error: String = ""
    @State private var quizFinished = false
    
    @State private var score = 0
    @State private var correctQuestions: [Bool] = []
    
    var body: some View {
        ZStack {
            // MARK: Background
            LinearGradient(colors: [Color("bg-purple-dark"), Color("bg-purple")],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            if !error.isEmpty {
                Text(error)
                    .font(.headline)
                    .foregroundColor(.red)
                    .padding()
            } else if quizFinished {
                VStack {
                    QuizCompleteView(
                        deck: deck,
                        score: score,
                        correctQuestions: correctQuestions,
                        restart: restartQuiz
                    )
                }
            } else {
                    
                if options.count == 4 {
                    VStack {
                        Spacer()
                            .frame(height: 5)
                        QuizBannerView(deck: deck)
                        QuizContent(
                            questionNum: currentIdx + 1,
                            questionCount: deck.cards.count,
                            question: deck.cards[currentIdx].question,
                            options: $options,
                            selectedAnswer: $selectedAnswer,
                            btnColor: buttonColor,
                            next: nextQuestion
                        )
                        .offset(y: -25)
                    }
                    .offset(y:-50)
                    
                } else {
                    Text("An unexpected error occurred")
                        .font(.headline)
                        .foregroundColor(.red)
                        .padding()
                }
            }
        }
        .onAppear {
            setupQuiz()
        }
        .onChange(of: deck) {
            setupQuiz()
        }
    }

    // MARK: Logic
    
    private func setupQuiz() {
        if deck.cards.count < 4 {
            if error == "" {
                error = "Add at least 4 cards to start a quiz."
            }
            return
        }
        if deck.deletedAt != nil {
            if error == "" {
                error = "This deck has been deleted."
            }
            return
        }
        error = ""
        generateOptions()
    }

    private func generateOptions() {
        let correctCard = deck.cards[currentIdx]
        var answers = [correctCard.answer]

        let otherAnswers = deck.cards
            .filter { $0.id != correctCard.id }
            .map { $0.answer }
            .shuffled()
        
        answers.append(contentsOf: otherAnswers.prefix(3))
        options = answers.shuffled()
    }
    
    func buttonColor(for option: String, selection: String?) -> String {
        guard let selected = selection else { return "purple" }
        
        if option == deck.cards[currentIdx].answer {
            return "green"
        } else if option == selected {
            return "red"
        }
        return "gray"
    }

    private func nextQuestion() {
        if selectedAnswer == deck.cards[currentIdx].answer {
            score += 1
            deck.cards[currentIdx].skill = min(deck.cards[currentIdx].skill + 1, 5)
            correctQuestions.append(true)
        } else {
            deck.cards[currentIdx].skill = max(deck.cards[currentIdx].skill - 1, 0)
            correctQuestions.append(false)
        }
        
        if currentIdx + 1 < deck.cards.count {
            currentIdx += 1
            selectedAnswer = nil
            generateOptions()
        } else {
            quizFinished = true
        }
    }
    
    private func restartQuiz() {
        currentIdx = 0
        score = 0
        correctQuestions = []
        selectedAnswer = nil
        quizFinished = false
        generateOptions()
    }
}

#Preview {
    QuizView(deck: .constant(appleTriviaDeck))
}
