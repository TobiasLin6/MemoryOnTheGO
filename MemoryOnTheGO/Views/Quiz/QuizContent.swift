//
//  QuizContent.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 2/19/26.
//

import SwiftUI
import Combine

struct QuizContent: View {
    
    let questionNum: Int
    let questionCount: Int
    let question: String
    @Binding var options: [String]
    @Binding var selectedAnswer: String?
    let btnColor: (String, String) -> String
    let next: () -> Void
    
    @State private var timeRemaining = 10
    let timer = Timer.publish(every: 1, on: .main, in: .common)
    @State private var connectedTimer: (any Cancellable)? = nil
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color("quiz-question-outline"), lineWidth: 3)
                .frame(height: 150)
                .background(Color("quiz-question-bg"))
                .overlay(
                    VStack {
                        HStack {
                            Text("Question \(questionNum)")
                                .font(.custom(Constants.Fonts.regular, size: 16))
                                .foregroundColor(Color("main-dark-gray"))
                            Spacer()
                        }
                        Spacer()
                        HStack {
                            Spacer()
                            Text(question)
                                .multilineTextAlignment(.center)
                                .font(.custom(Constants.Fonts.regular, size: 21))
                                .foregroundColor(Color("main-gray"))
                            Spacer()
                        }
                        Spacer()
                        HStack {
                            Spacer()
                            Text("\(questionNum) / \(questionCount) Questions")
                                .font(.custom(Constants.Fonts.regular, size: 16))
                                .foregroundColor(Color("main-dark-gray"))
                        }
                    }
                    .padding(12)
                )
                .padding(.bottom, 12)
            
            HStack {
                QuizAnswerChoice(
                    text: options[0],
                    selection: $selectedAnswer,
                    btnColor: btnColor
                )
                .padding(.trailing, 12)
                QuizAnswerChoice(
                    text: options[1],
                    selection: $selectedAnswer,
                    btnColor: btnColor
                )
            }
            .padding(.bottom, 12)
            HStack {
                QuizAnswerChoice(
                    text: options[2],
                    selection: $selectedAnswer,
                    btnColor: btnColor
                )
                .padding(.trailing, 12)
                QuizAnswerChoice(
                    text: options[3],
                    selection: $selectedAnswer,
                    btnColor: btnColor
                )
            }
            .padding(.bottom, 12)
            Button {
                withAnimation(.easeInOut(duration: 0.2)) {
                    selectedAnswer = ""
                }
            } label: {
                RoundedRectangle(cornerRadius: 1)
                    .fill(Color(selectedAnswer != nil ? "quiz-choice-gray-bg" : "quiz-choice-bg"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke((Color(selectedAnswer != nil ? "quiz-choice-gray-outline" : "quiz-choice-outline")), lineWidth: 3)
                    )
                    .frame(height: 30)
                    .frame(maxWidth: .infinity)
                    .overlay (
                        HStack {
                            Text("I'm not sure")
                                .font(.custom(Constants.Fonts.regular, size: 16))
                                .foregroundColor(Color(selectedAnswer != nil ? "quiz-choice-gray-text" : "main-gray"))
                                .padding(.horizontal)
                            Spacer()
                        }
                    )
            }
            .disabled(selectedAnswer != nil)
            if selectedAnswer != nil {
                Button {
                    next()
                }
                label: {
                    Text("Next Question (\(timeRemaining))")
                        .underline()
                        .font(.custom(Constants.Fonts.regular, size: 18))
                }
                .padding(.top, 5)
                .padding(.bottom, 12)
                .onReceive(timer) { _ in
                        if timeRemaining > 0 {
                            timeRemaining -= 1
                        } else {
                            next()
                        }
                    }
            }
            
            
        }
        .padding()
        .onChange(of: selectedAnswer) {
            if selectedAnswer != nil && selectedAnswer != "" {
                timeRemaining = 10
                connectedTimer = timer.connect()
            } else {
                connectedTimer?.cancel()
            }
        }
        .onChange(of: question) {
            timeRemaining = 10
            connectedTimer?.cancel()
        }
    }
}



func placeholder (x: String, y: String) -> String {
    return x
}
#Preview {
    QuizContent(questionNum: 1, questionCount: 10, question: "Sample Question", options: .constant(["Answer 1", "Answer 2", "Answer 3", "Answer 4"]), selectedAnswer: .constant(""), btnColor: placeholder, next: {})
}
