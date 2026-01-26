//
//  Text field.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 1/24/26.
//

import SwiftUI

struct ModalTextField: View {
    var label: String
    var maxChars: Int
    var height: CGFloat  // In number of lines of text
    
    @Binding var text: String
    
    @State private var charCount: Int = 0
    
    var body: some View {
        VStack {
            HStack {
                Text(label)
                    .font(.custom(Constants.Fonts.regular, size: 22))
                    .foregroundColor(Color("main-gray"))
                Spacer()
            }
            .offset(y: 10)

            
            TextField("", text: $text, axis: .vertical)
                .multilineTextAlignment(.leading)
                .padding(12)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .frame(height: (54 + 30 * (height - 1)))
                .cornerRadius(8)
                .foregroundStyle(Color("main-gray"))
                .tint(Color("main-gray"))
                .font(.custom(Constants.Fonts.regular, size: 24))
                .background(Color("text-field-bg"))
                .cornerRadius(8)
                .shadow(color:Color(.black).opacity(0.6), radius: 5)
            
            HStack {
                Spacer()
                Text("\(charCount) / \(maxChars) Characters")
                    .font(.custom(Constants.Fonts.regular, size: 17))
                    .foregroundColor(Color("main-gray"))
            }
            
        }
        .onChange(of: text) { _, newVal in
            charCount = newVal.count
            if charCount >= maxChars {
                text = String(newVal.prefix(maxChars))
            }
        }
        
            
    }
}

#Preview {
    @Previewable @State var text = ""
    ModalTextField(label: "Preview", maxChars: 20, height: 1, text: $text)
        .padding()
}
