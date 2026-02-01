//
//  FlashcardCardView.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 2/1/26.
//

import SwiftUI

struct FlashcardCardView: View {
    let deck: Deck
    @Binding var flashcardIdx: Int
    @State var cardFront: Bool = true
    @State var leftDisabled: Bool = false
    @State var rightDisabled: Bool = false
    @State var xOffset: CGFloat = 0
    @State var yOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            // MARK: Swipe Actions
            ZStack {
                HStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color("prev-card-bg"))
                        .stroke(Color("prev-card-outline"), lineWidth: 2)
                        .frame(width: 70)
                        .overlay {
                            Text("Prev Card")
                                .font(.custom(Constants.Fonts.bold, size: 20))
                                .foregroundColor(Color("main-gray"))
                        }
                        .opacity(xOffset > 0 ? 1 : 0)
                    
                    Spacer()
                    
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color("next-card-bg"))
                        .stroke(Color("next-card-outline"), lineWidth: 2)
                        .frame(width: 70)
                        .overlay {
                            Text("Next Card")
                                .font(.custom(Constants.Fonts.bold, size: 20))
                                .foregroundColor(Color("main-gray"))
                        }
                        .opacity(xOffset < 0 ? 1 : 0)
                    
                }
                VStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color("incorrect-card-bg"))
                        .stroke(Color("incorrect-card-outline"), lineWidth: 2)
                        .frame(height: 35)
                        .overlay {
                            Text("Incorrect")
                                .font(.custom(Constants.Fonts.bold, size: 20))
                                .foregroundColor(Color("main-gray"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                        }
                        .opacity(yOffset > 0 ? 1 : 0)
                    
                    Spacer()
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color("correct-card-bg"))
                        .stroke(Color("correct-card-outline"), lineWidth: 2)
                        .frame(height: 35)
                        .overlay {
                            Text("Correct")
                                .font(.custom(Constants.Fonts.bold, size: 20))
                                .foregroundColor(Color("main-gray"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                        }
                        .opacity(yOffset < 0 ? 1 : 0)
                }
            }
            .frame(width: 375, height: 245)
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color("flashcard-bg"))
                    .stroke(Color(.black), lineWidth: 3)
                    .frame(width: 375, height: 245)
                    .shadow(radius: 3)
                
                UnevenRoundedRectangle(topLeadingRadius: 12, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 12)
                    .fill(Color("flashcard-top"))
                    .stroke(Color(.black), lineWidth: 3)
                    .frame(width: 375, height:45)
                    .offset(y: -105)
                
                
                if cardFront {
                    HStack {
                        Spacer()
                        Text("Card \(flashcardIdx + 1) / \(deck.cards.count)")
                            .font(.custom(Constants.Fonts.regular, size: 14))
                            .foregroundColor(Color("flashcard-top"))
                            .offset(y: 105)
                    }
                    .padding(23)
                } else {
                    HStack {
                        Text("Card \(flashcardIdx + 1) / \(deck.cards.count)")
                            .font(.custom(Constants.Fonts.regular, size: 14))
                            .foregroundColor(Color("flashcard-top"))
                            .offset(y: 105)
                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: -1, z: 0))
                        Spacer()
                    }
                    .padding(23)
                }
                
                
                
                
                // MARK: Content
                if deck.cards.count > 0 {
                    if cardFront {
                        Text(deck.cards[flashcardIdx].question)
                            .font(.custom(Constants.Fonts.regular, size: 25))
                            .multilineTextAlignment(.center)
                            .padding(43)
                            .offset(y:17)
                            .foregroundColor(.white)
                    } else {
                        Text(deck.cards[flashcardIdx].answer)
                            .font(.custom(Constants.Fonts.regular, size: 25))
                            .multilineTextAlignment(.center)
                            .padding(43)
                            .offset(y:17)
                            .foregroundColor(.white)
                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: -1, z: 0))
                    }
                }
            }
            .rotation3DEffect(
                .degrees(cardFront ? 0 : 180),
                axis: (x: 0, y: -1, z: 0)
            )
            .onTapGesture {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                    cardFront.toggle()
                }
            }
            .offset(x: xOffset, y: yOffset)
            .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            if abs(gesture.translation.width) > abs(gesture.translation.height) {
                                xOffset = max(min(gesture.translation.width, 110), -110)
                                yOffset = 0
                            } else {
                                xOffset = 0
                                yOffset = max(min(gesture.translation.height, 75), -75)
                            }
                        }
                        .onEnded { _ in
                            withAnimation(.spring()) {
                                if abs(xOffset) > 60 {
                                    if xOffset > 0 {
                                        xOffset = 90
                                        Task {
                                            try? await Task.sleep(nanoseconds: 200_000_000)
                                            if !leftDisabled {
                                                flashcardIdx -= 1
                                                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                                    cardFront = true
                                                }
                                            }
                                            
                                            withAnimation(.spring()) {
                                                xOffset = 0
                                            }
                                        }
                                    } else {
                                        xOffset = -90
                                        Task {
                                            try? await Task.sleep(nanoseconds: 200_000_000)
                                            if !rightDisabled{
                                                flashcardIdx += 1
                                                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                                    cardFront = true
                                                }
                                            }
                                            
                                            withAnimation(.spring()) {
                                                xOffset = 0
                                            }
                                        }
                                    }
                                }
                                else if abs(yOffset) > 60 {
                                    if yOffset > 0 {
                                        yOffset = 55
                                        Task {
                                            try? await Task.sleep(nanoseconds: 200_000_000)
                                            deck.cards[flashcardIdx].skill = max(0, deck.cards[flashcardIdx].skill - 1)
                                            if !rightDisabled{
                                                flashcardIdx += 1
                                                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                                    cardFront = true
                                                }
                                            }
                                            withAnimation(.spring()) {
                                                yOffset = 0
                                            }
                                        }
                                    } else {
                                        yOffset = -55
                                        Task {
                                            try? await Task.sleep(nanoseconds: 200_000_000)
                                            deck.cards[flashcardIdx].skill = min(5, deck.cards[flashcardIdx].skill  + 1)
                                            if !rightDisabled{
                                                flashcardIdx += 1
                                                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                                    cardFront = true
                                                }
                                            }
                                            withAnimation(.spring()) {
                                                yOffset = 0
                                            }
                                        }
                                    }
                                }
                                else {
                                    xOffset = 0
                                    yOffset = 0
                                }
                            }
                        }
                )
            
            
            // MARK: Buttons
            HStack {
                Button {
                    if !leftDisabled {
                        flashcardIdx -= 1
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            cardFront = true
                        }
                    }
                } label: {
                    ZStack {
                        Circle()
                            .fill(LinearGradient(colors: [.white, Color(white: 0.4)], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .shadow(radius: 3)
                            .frame(width: 36, height: 36)
                        Image(systemName: "chevron.left")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 15)
                            .foregroundColor(.black)
                    }
                    .opacity(leftDisabled ? 0.2 : 1)
                }
                Spacer()
                Button {
                    if !rightDisabled{
                        flashcardIdx += 1
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            cardFront = true
                        }
                    }
                } label: {
                    ZStack {
                        Circle()
                            .fill(LinearGradient(colors: [.white, Color(white: 0.4)], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .shadow(radius: 3)
                            .frame(width: 36, height: 36)
                        Image(systemName: "chevron.right")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 15)
                            .foregroundColor(.black)
                    }
                    .opacity(rightDisabled ? 0.2 : 1)
                    
                }
                
            }
            .padding(.horizontal, 8)
            .offset(y: 17)
            .onAppear() {
                rightDisabled = flashcardIdx >= deck.cards.count - 1
                leftDisabled = flashcardIdx <= 0
            }
            .onChange(of: flashcardIdx) {_, newVal in
                rightDisabled = newVal >= deck.cards.count - 1
                leftDisabled = newVal <= 0
            }
            
            
            
            
        }
    }
}

#Preview {
    FlashcardCardView(deck: appleTriviaDeck, flashcardIdx: .constant(0))
}
