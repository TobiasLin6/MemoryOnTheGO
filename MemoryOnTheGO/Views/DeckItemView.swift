//
//  DeckItemView.swift
//  FlashMemory
//
//  Created by Tobias on 1/10/26.
//

import SwiftUI

struct VerticalLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .center, spacing: 4) {
            configuration.icon
            configuration.title
        }
    }
}

struct DeckItemView: View {
    @Environment(\.modelContext) private var context
    let deck: Deck
    
    @State private var offset: CGFloat = 0
    let leadingWidth: CGFloat = 105
    let trailingWidth: CGFloat = 200

    var body: some View {
        
        ZStack {
            // MARK: Swipe Right
            HStack {
                Button(role: .destructive) {
                    softDeleteDeck(deck, from: context)
                    withAnimation { offset = 0 }
                } label: {
                    VStack(spacing: 4) {
                        Image(systemName: "trash")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 26, height: 26)
                        Text("Delete")
                            .font(.custom(Constants.Fonts.regular, size: 14))
                    }
                    .foregroundColor(.white)
                    .frame(width: 80, height: 80)
                    .background(Color.red.opacity(0.2))
                    .cornerRadius(45)
                    .overlay(RoundedRectangle(cornerRadius: 45).stroke(Color.red, lineWidth: 2))
                }
                Spacer()
            }
            .padding(.leading, 5)
            .opacity(offset > 0 ? 1 : 0)

            // MARK: Swipe Left
            HStack(spacing: 12) {
                Spacer()

                // Pin Button
                Button() {
                    if deck.pinned {
                        unpinDeck(deck, in: context)
                    } else {
                        pinDeck(deck, in: context)
                    }
                    withAnimation { offset = 0 }
                } label: {
                    VStack(spacing: 4) {
                        Image(systemName: deck.pinned ? "pin.slash" : "pin")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 26, height: 26)
                        Text(deck.pinned ? "Unpin" : "Pin")
                            .font(.custom(Constants.Fonts.regular, size: 14))
                    }
                    .foregroundColor(.white)
                    .frame(width: 80, height: 80)
                    .background(Color.orange.opacity(0.2))
                    .cornerRadius(45)
                    .overlay(RoundedRectangle(cornerRadius: 45).stroke(Color.orange, lineWidth: 2))
                }
                .padding(.trailing, 2)

                // Edit Button
                Button() {
                    // TODO: Add edit functionality
                    withAnimation { offset = 0 }
                } label: {
                    VStack(spacing: 4) {
                        Image(systemName: "square.and.pencil")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 26, height: 26)
                        Text("Edit")
                            .font(.custom(Constants.Fonts.regular, size: 14))
                    }
                    .foregroundColor(.white)
                    .frame(width: 80, height: 80)
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(45)
                    .overlay(RoundedRectangle(cornerRadius: 45).stroke(Color.blue, lineWidth: 2))
                }
            }
            .padding(.trailing, 5)
            .opacity(offset < 0 ? 1 : 0)
            
            
            
            
            // MARK: Content
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("deck-itm-border"), lineWidth: 4)
                
                HStack{
                    //Image
                    deck.img.image
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 85, height: 75)
                        .foregroundColor(Color("main-gray"))
                        .padding(.trailing, 8)
                    
                    VStack(alignment: .leading) {
                        Text(deck.name)
                            .font(.custom(Constants.Fonts.regular, size: 22))
                        Spacer()
                            .frame(height: 5)
                        Text(deck.desc)
                            .font(.custom(Constants.Fonts.regular, size: 15))
                            .foregroundColor(Color("main-gray"))
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .padding(.trailing, 2)
                        .shadow(color:.black, radius: 2)
                    
                }
                .padding()
                .frame(height: 100)
                .background(Color("deck-itm-bg"))
                .foregroundColor(.white)
                .cornerRadius(8)
                .overlay{
                    if deck.pinned {
                        HStack{
                            Spacer()
                            VStack{
                                Button {
                                    unpinDeck(deck, in: context)
                                } label: {
                                    Image(systemName: "pin")
                                        .padding(.trailing, 10)
                                        .padding(.top, 14)
                                        .foregroundColor(Color("deck-itm-pin"))
                                }
                                Spacer()
                            }
                        }
                    } else {
                        HStack{}
                    }
                }
            }
            .offset(x: offset)
            .gesture(
                DragGesture(minimumDistance: 30)
                    .onChanged { value in
                        offset = value.translation.width
                    }
                    .onEnded { value in
                        withAnimation(.spring()) {
                            if value.translation.width > leadingWidth / 2 {
                                offset = leadingWidth
                            } else if value.translation.width < -trailingWidth / 2 {
                                offset = -trailingWidth
                            } else {
                                offset = 0
                            }
                        }
                    }
            )
            
            
            
        }
        .padding(.horizontal, 1)
        .padding(.vertical, 5)
        
        
        
        
        
        
        
        
//        .swipeActions(edge: .leading) {
//            Button(role: .destructive) {
//                softDeleteDeck(deck, from: context)
//            } label: {
//                Image(systemName: "trash")
//            }
//        }
//    
//        .swipeActions(edge: .trailing) {
//            Button {
//                exportDecks([deck], in: context)
//            } label: {
//                Label("Edit", systemImage:"square.and.pencil")
//                    .labelStyle(VerticalLabelStyle())
//
//            }
//            .tint(.blue)
//            
//            Button {
//                if deck.pinned{
//                    unpinDeck(deck, in: context)
//                } else {
//                    pinDeck(deck, in: context)
//                }
//                    
//            } label : {
//                Image(systemName: deck.pinned ? "pin.slash": "pin")
//            }
//            .tint(.orange)
//            
//        }
        
    }
}

#Preview {
    VStack(alignment: .leading, spacing: 12) {
        DeckItemView(deck: appleTriviaDeck)
    }
    .padding()
}
