//
//  TutorialBtn.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 1/15/26.
//

import SwiftUI

struct CaseStudyBtn: View {
    
    @Environment(AppState.self) var appState
    
    @Binding var showCaseStudy: Bool
    
    var body: some View {
        HStack {
            Button {
                showCaseStudy = true
            } label: {
                ZStack {
                    // MARK: Background
                    UnevenRoundedRectangle(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 25,
                        topTrailingRadius: 25
                    )
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [Color("tutorial-bg-light"), Color("tutorial-bg-dark")]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
                    .frame(width: 160, height: 80)
                    
                    // MARK: Content
                    HStack {
                        Image(systemName: "lightbulb")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 26, height: 34)
                            .shadow(color: .white, radius: 4)
                        
                        Spacer()
                            .frame(width: 16)
                        
                        Text("Case \nStudy")
                            .foregroundColor(.white)
                            .font(.custom(Constants.Fonts.regular, size: 20))
                            .shadow(color: .white, radius: 1)
                    }
                    .padding(.leading, -10)
                }
            }
            .buttonStyle(PlainButtonStyle())
            
            Spacer()
        }
        .padding(.bottom, 185)
    }
}

#Preview {
    CaseStudyBtn(showCaseStudy: .constant(true))
        .environment(AppState())
}
