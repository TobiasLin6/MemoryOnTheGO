//
//  QuizView.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 2/19/26.
//

import SwiftUI

struct QuizView: View {
    @Binding var deck: Deck
    @State var error: String = ""
    
    var body: some View {
        ZStack {
            if !error.isEmpty {
                Text(error)
                    .font(.largeTitle)
                    .foregroundColor(.red)
            } else {
                Text("Quiz View")
            }
        }
        .onAppear() {
            if deck.cards.count < 4 {
                error = "Too few cards. Add more cards to your deck to enable quiz view."
            }
        }
        
    }
}

#Preview {
    QuizView(deck: .constant(appleTriviaDeck))
}
