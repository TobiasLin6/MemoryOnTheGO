//
//  ContentView.swift
//  FlashMemory
//
//  Created by Tobias on 1/10/26.
//

import SwiftUI

struct MemoryOnTheGO: View {
    
    @State var devMode = true
    
    var body: some View {
        TabView {
            Tab("My Decks", systemImage:"folder") {
                MyDecksView(devMode: $devMode)
            }
            Tab("About", systemImage: "lightbulb") {
                AboutView()
            }
            Tab("Settings", systemImage: "gearshape") {
                SettingsView()
            }
        }
    }
}

#Preview {
    MemoryOnTheGO()
}
