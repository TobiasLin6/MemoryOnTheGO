//
//  AddDeckButton.swift
//  FlashMemory
//
//  Created by Tobias on 1/11/26.
//

import SwiftUI
import SwiftData

struct AddDeckBtn: View {
    @Environment(\.modelContext) private var context
    
    @Binding var showNewDeckModal: Bool
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                Button {
                    showNewDeckModal.toggle()
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: 50, height: 50)
                        Image(systemName: "plus")
                            .foregroundStyle(Color.white)
                    }
                }
            }
        }
        
    }
}

#Preview {
    AddDeckBtn(showNewDeckModal: .constant(false))
}
