//
//  ModalTitle.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 1/24/26.
//

import SwiftUI

struct ModalTitle: View {
    var title: String
    var body: some View {
        
        Text(title)
            .font(.custom(Constants.Fonts.regular, size: 32))
            .foregroundStyle(
                LinearGradient(
                    colors: [.white, Color("modal-title-dark")],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .padding(.horizontal, -35)
            .frame(height: 65)
            .background {
                RoundedRectangle(cornerRadius: 33)
                    .fill(Color("modal-title-dark"))
                    .frame(height: 3)
                    .offset(y: 25)
                    
            }
    }
}

#Preview {
    ModalTitle(title: "Preview")
}
