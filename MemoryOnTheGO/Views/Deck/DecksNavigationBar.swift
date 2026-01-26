//
//  DecksNavigationBar.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 1/16/26.
//

import SwiftUI

struct DecksNavigationBar: View {
    @Binding var currentChoice: String
    
    @State private var selectorOffset: CGFloat = -90
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button {
                        currentChoice = "pinned"
                    } label: {
                        Text("Pinned Decks")
                            .foregroundColor(.white)
                            .font(.custom(Constants.Fonts.regular, size: 16))
                    }
                    Spacer()
                        .frame(width: 115)
                    Button {
                        currentChoice = "all"
                    } label: {
                        Text("All Decks")
                            .foregroundColor(.white)
                            .font(.custom(Constants.Fonts.regular, size: 16))
                    }
                    Spacer()
                }
                
                
                
                ZStack {
                    Rectangle()
                        .fill(Color("decks-nav-underline"))
                        .frame(height: 2)
                        .frame(maxWidth: .infinity)
                        .offset(y: -5)
                    
                    Rectangle()
                        .fill(LinearGradient(
                            colors: [Color(.clear), Color("decks-nav-selector"), Color("decks-nav-selector"),Color("decks-nav-selector"), Color(.clear)],
                            startPoint: .leading,
                            endPoint: .trailing))
                        .frame(width: 150, height: 7)
                        .offset(y: -6)
                        .offset(x: selectorOffset)
                        .blur(radius: 5)
                }
                .onAppear{
                    selectorOffset = currentChoice == "pinned" ? -90 : 110
                }
                .onChange(of: currentChoice) { _, newVal in
                    withAnimation(.easeInOut(duration: 0.2)) {
                        if newVal == "pinned" {
                            selectorOffset = -90
                        } else {
                            selectorOffset = 110
                        }
                    }
                    
                }
            }
            HStack {
                Spacer()
                Button {
                    // TODO: Add functionality
                } label: {
                    Image(systemName: "ellipsis.circle")
                        .resizable()
                        .frame(width: 26, height: 26)
                        .foregroundColor(Color("deck-itm-pin"))
                }
            }
            .offset(x: -10, y: -32)
        }
    }
}

#Preview {
    @Previewable @State var choice = "pinned"
    DecksNavigationBar(currentChoice: $choice)
        .preferredColorScheme(.dark)
}
