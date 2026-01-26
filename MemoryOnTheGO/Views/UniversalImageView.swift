//
//  UniversalImageView.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 1/24/26.
//

import SwiftUI
import UIKit

struct UniversalImageView: View {
    let source: UniversalImage
    
    var body: some View {
        switch source {
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
#Preview {
    UniversalImageView(source: .symbol("photo"))
}
