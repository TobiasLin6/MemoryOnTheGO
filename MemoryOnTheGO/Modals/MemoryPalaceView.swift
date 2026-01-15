//
//  MemoryPalaceView.swift
//  FlashMemory
//
//  Created by Tobias on 1/11/26.
//

import SwiftUI

struct MemoryPalaceView: View {
    
    let deck: Deck
    
    var body: some View {
        Text("Memory Palace")
    }
}

#Preview {
    MemoryPalaceView(deck: appleTriviaDeck)
}
