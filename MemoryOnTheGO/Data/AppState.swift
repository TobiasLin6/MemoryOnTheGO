//
//  AppState.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 2/2/26.
//

import Foundation

@Observable
class AppState {
    var navID: UUID = UUID()
    var currentPage: String = "home"
    var hideTabBar: Bool = false
    
    func switchToQuiz() {
        self.currentPage = "quiz"
    }
}
