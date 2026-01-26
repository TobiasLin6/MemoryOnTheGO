//
//  AboutView.swift
//  FlashMemory
//
//  Created by Tobias on 1/10/26.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            Text("About")
            Rectangle()
                .fill(.red)
                .frame(width: 300, height: 100)
        }
    }
}

#Preview {
    AboutView()
}
