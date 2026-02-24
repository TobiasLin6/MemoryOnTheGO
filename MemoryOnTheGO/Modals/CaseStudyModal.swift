//
//  CaseStudyModal.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 2/22/26.
//

import SwiftUI

struct CaseStudyModal: View {
    
    @Binding var showCaseStudy: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(
                LinearGradient (
                    gradient: Gradient(colors: [Color("modal-bg-dark"), Color("modal-bg-light")]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .frame(width: 350, height: 575)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .inset(by: -2)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [Color("home-modal-1"), Color("home-modal-2"), Color("home-modal-1")]),
                            startPoint: .leading,
                            endPoint: .trailing
                        ),
                        lineWidth: 4
                    )
            )
            .shadow(radius: 8)
        VStack(alignment: .center) {
            
            HStack {
                Spacer()
                Button {
                    showCaseStudy = false
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 21, height: 21)
                        .foregroundColor(Color("deck-itm-pin"))
                }
            }
            Group {
                Text("Welcome to \n MemoryOnTheGo!")
                    .font(.custom(Constants.Fonts.bold, size: 28))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 5)
                Text("        Hi, I'm Tobias, the creator of this app. Living in the hustle of NYC's rapidly evolving tech scene, I constantly strugged with information overload and retaining new ideas. To solve this, I developed MemoryOnTheGo, an app rooted in professional research that leverages techniques like the memory palace to help users organize and lock in knowledge. I hope you enjoy!")
                    .font(.custom(Constants.Fonts.regular, size: 18))
                    .foregroundColor(.white)
                    .padding(.bottom, 15)
                    .lineSpacing(5)
                Text("If you're interested in seeing my full case study, go to:")
                    .font(.custom(Constants.Fonts.regular, size: 18))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 2)
                    .foregroundColor(Color("main-gray"))
                Text("tobiaslin.com/memory-app")
                    .font(.custom(Constants.Fonts.regular, size: 18))
                    .foregroundColor(Color("main-gray"))
            }
            .offset(y: -20)
            Spacer()
        }
        .frame(width: 275, height: 540)
        .offset(y: 10)
    }
    
}

#Preview {
    CaseStudyModal(showCaseStudy: .constant(false))
}
