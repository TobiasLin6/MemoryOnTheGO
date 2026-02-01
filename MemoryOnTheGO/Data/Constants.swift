//
//  Constants.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 1/16/26.
//

import SwiftUI

enum Constants {
    
    static let dragDismissThreshold: CGFloat = 100
    static let maxModalHeight: CGFloat = 840
    static let lowModalOffset: CGFloat = 560
    static let highModalOffset: CGFloat = 70
    
    static let decksNavPickerPinned: CGFloat = -90
    static let decksNavPickerAll: CGFloat = 110
    
    static let deckNameMaxChars: Int = 25
    static let deckDescMaxChars: Int = 100
    
    static let createDeckModalHeight: CGFloat = 800
    static let uploadPhotoModalHeight: CGFloat = 600

    
    enum Fonts {
        static let regular = "SFCompactText-Regular"
        static let bold = "SFCompactText-Bold"
    }
}
