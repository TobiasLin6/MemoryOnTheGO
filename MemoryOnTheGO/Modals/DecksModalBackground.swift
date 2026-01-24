//
//  DecksModalBackground.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 1/16/26.
//

import SwiftUI
import VisualEffectBlurView

struct DecksModalBackground: View {
    
    @Binding var currentPage: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(
                Color("home-modal-3")
            )
            .opacity(0.6)
            .frame(maxWidth: .infinity)
            .frame(height: Constants.maxModalHeight)
            .overlay(
                VisualEffectBlur(
                    blurEffectStyle: .constant(.systemUltraThinMaterialDark),
                    blurRadius: .constant(8)
                )
                .cornerRadius(25)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .inset(by: -3)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [Color("home-modal-1"), Color("home-modal-2"), Color("home-modal-1")]),
                            startPoint: .leading,
                            endPoint: .trailing
                        ),
                        lineWidth: 6
                    )
            )
            .overlay(
                VStack {
                    Capsule()
                        .fill(.black)
                        .opacity(0.4)
                        .frame(width: 45, height: 6)
                        .padding(.top, 12)
                    Spacer()
                }
                
            )
            

        }
        
    
}

#Preview {
    DecksModalBackground(currentPage: .constant("home"))
}
