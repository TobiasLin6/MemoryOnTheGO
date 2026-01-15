//
//  FlashMemoryApp.swift
//  FlashMemory
//
//  Created by Tobias on 1/10/26.
//

import SwiftUI
import SwiftData


@main
struct MemoryOnTheGOApp: App {
    var body: some Scene {
        WindowGroup {
            MemoryOnTheGO()
        }
        .modelContainer(for: [FlashCard.self, Deck.self])
    }
}

