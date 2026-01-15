//
//  NewDeckModal.swift
//  FlashMemory
//
//  Created by Tobias on 1/11/26.
//

import SwiftUI

struct NewDeckView: View {
    
    @Environment(\.modelContext) private var context
    
    var body: some View {
        VStack {
            Button {
                addDeck(Deck(), to: context)
            } label: {Label("Add Deck", systemImage: "plus")}
        }
    }
}

#Preview {
    NewDeckView()
}
