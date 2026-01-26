//
//  CloseBtn.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 1/25/26.
//

import SwiftUI

struct CloseBtn: View {
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "xmark")
                .resizable()
                .frame(width: 22, height: 22)
                .foregroundColor(Color("deck-itm-pin"))
        }
    }
}

#Preview {
    CloseBtn(action:{})
}
