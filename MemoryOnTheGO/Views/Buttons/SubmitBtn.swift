//
//  SubmitBtn.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 1/24/26.
//

import SwiftUI

struct SubmitBtn: View {
    var title: String
    var onTap: () -> Void
    
    var body: some View {
        Button {
            onTap()
        } label:
        {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("text-field-bg"))
                .stroke(Color("bg-purple-dark"), lineWidth: 3)
                .frame(height: 40)
                .overlay (
                    Text(title)
                        .font(.custom(Constants.Fonts.regular, size: 22))
                        .foregroundColor(Color("main-gray"))
                )
        }
    }
}

#Preview {
    SubmitBtn(title: "Preview", onTap: {})
}
