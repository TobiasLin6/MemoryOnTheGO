//
//  UniversalImage.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 1/16/26.
//

import UIKit
import SwiftUI

enum UniversalImage: Identifiable, Codable {
    case asset (String)
    case imageData(Data)
    case symbol(String)
    
    var id: String {
        switch self {
        case .asset(let name): return "asset-\(name)"
        case .imageData(let data): return "data-\(data.hashValue)"
        case .symbol(let name): return "symbol-\(name)"
        }
    }
    
    @ViewBuilder
    var image: some View {
        switch self {
            
        case .asset(let name):
            Image(name)
                .resizable()
            
        case .imageData(let data):
            if let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
            } else {
                Image(systemName: "photo")
                    .resizable()
            }
            
        case .symbol(let name):
            Image(systemName: name)
                .resizable()
            
        }
    }
}
