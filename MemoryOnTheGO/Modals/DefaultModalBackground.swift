//
//  DefaultModalBackground.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 1/24/26.
//

import SwiftUI

struct DefaultModalBackground: View {
    
    @State var height: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(
                LinearGradient (
                    gradient: Gradient(colors: [Color("modal-bg-dark"), Color("modal-bg-light")]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .frame(maxWidth: .infinity)
            .frame(height: height)
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
    DefaultModalBackground(height: 700)
}
