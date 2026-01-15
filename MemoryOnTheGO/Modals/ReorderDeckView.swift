//
//  ReorderDeckModal.swift
//  FlashMemory
//
//  Created by Tobias on 1/11/26.
//

import SwiftUI

struct ReorderDeckView: View {
    
    let deck: Deck
    
    var body: some View {
        Text("Reorder Deck")
    }
}

#Preview {
    ReorderDeckView(deck: appleTriviaDeck)
}
