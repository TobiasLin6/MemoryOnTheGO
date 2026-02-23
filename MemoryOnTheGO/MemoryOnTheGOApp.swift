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
    @State private var appState = AppState()
    let notify = NotificationManager.instance
    
    var body: some Scene {
        WindowGroup {
            MemoryOnTheGO()
                .environment(appState)
                .onAppear {
                    notify.appState = appState
                    notify.requestAuthorization()
                }
        }
        .modelContainer(for: [FlashCard.self, Deck.self])
    }
}

