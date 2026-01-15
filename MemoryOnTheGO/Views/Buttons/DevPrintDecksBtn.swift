//
//  DevPrintDecksBtn.swift
//  FlashMemory
//
//  Created by Tobias on 1/11/26.
//

import SwiftUI
import SwiftData

struct DevPrintDecksBtn: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Deck.sortOrder) private var allDecks: [Deck]
    
    
    var body: some View {
        VStack {
            Button {
                for deck in allDecks {print(deck)}
                print("--------------------------")
            } label: {Label("Print Decks", systemImage: "printer")}
                .padding()
            Spacer()
        }
    }
}

#Preview {
    DevPrintDecksBtn()
}
