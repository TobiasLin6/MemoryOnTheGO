//
//  QuizAnswerChoice.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 2/19/26.
//

import SwiftUI

struct QuizAnswerChoice: View {

    let text: String
    @Binding var selection: String?
    let btnColor: (String, String) -> String
    
    
    private var currentTheme: String {
        guard let currentSelection = selection else { return "default" }
        return btnColor(text, currentSelection)
    }
    
    private var bgColor: String {
        switch currentTheme {
        case "green": return "correct-card-bg"
        case "red":   return "incorrect-card-bg"
        case "purple": return "quiz-choice-bg"
        case "gray": return "quiz-choice-gray-bg"
        default:      return "quiz-choice-bg"
        }
    }

    private var outlineColor: String {
        switch currentTheme {
        case "green": return "correct-card-outline"
        case "red":   return "incorrect-card-outline"
        case "purple": return "quiz-choice-outline"
        case "gray": return "quiz-choice-gray-outline"
        default:      return "quiz-choice-outline"
        }
    }

    var body: some View {
        Button {
            withAnimation(.easeInOut(duration: 0.2)) {
                selection = text
            }
        } label: {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(bgColor))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(outlineColor), lineWidth: 3)
                )
                .frame(width: 175, height: 125)
                .overlay (
                    Text(text)
                        .font(.custom(Constants.Fonts.regular, size: 16))
                        .foregroundColor(Color(currentTheme == "gray" ? "quiz-choice-gray-text" : "main-gray"))
                        .multilineTextAlignment(.center)
                        .padding(8)
                )
        }
        .disabled(selection != nil)
    }
}

#Preview {
    QuizAnswerChoice(
        text: "Answer Choice",
        selection: .constant(nil),
        btnColor: placeholder
    )
}
