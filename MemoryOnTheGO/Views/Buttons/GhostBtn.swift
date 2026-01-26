//
//  GhostBtn.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 1/24/26.
//

import SwiftUI

struct GhostBtn: View {
    var title: String
    var horizPadding: CGFloat?
    var onTap: () -> Void
    
    var body: some View {
        Button {
            onTap()
        } label:
        {
            Text(title)
                .font(.custom(Constants.Fonts.regular, size: 22))
                .foregroundColor(Color("main-gray"))
                .padding(.horizontal, horizPadding ?? 65)
                .frame(height: 65)
                .background {
                    RoundedRectangle(cornerRadius: 33)
                        .fill(.clear)
                        .stroke(Color("text-field-bg"), lineWidth: 3)
                }
        }
    }
}

#Preview {
    GhostBtn(title: "Preview", onTap: { })
}
