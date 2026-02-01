//
//  SearchBar.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 2/1/26.
//

import SwiftUI

struct FlashcardSearchBar: View {
    @State var text: String = ""
    let items: [FlashCard]
    @Binding var filteredItems: [FlashCard]
    
    @FocusState.Binding var isTextFieldFocused: Bool
    
    var body: some View {
       
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("search-bg"))
                .stroke(Color("search-outline"), lineWidth: 2)
                .frame(height: 40)
            HStack {
                TextField("Search...", text: $text)
                    .textFieldStyle(.plain)
                    .onChange(of: text) { _, newValue in
                        filterData(query: newValue)
                    }
                    .foregroundColor(Color("main-gray"))
                    .font(.custom(Constants.Fonts.regular, size: 18))
                    .focused($isTextFieldFocused)
                
                if !text.isEmpty {
                    Button{text = ""} label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color("main-gray"))
                    }
                } else {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color("main-gray"))
                }
            }
            .padding(10)
        }
    }
    private func filterData(query: String) {
        if query.isEmpty {
            filteredItems = items
        } else {
            let filtered = items.filter {
                $0.searchText.lowercased().contains(query.lowercased())
            }
            filteredItems = filtered
        }
    }
}

#Preview {
    @FocusState var focused: Bool
    FlashcardSearchBar(items:appleCards, filteredItems: .constant([]), isTextFieldFocused: $focused)
}
