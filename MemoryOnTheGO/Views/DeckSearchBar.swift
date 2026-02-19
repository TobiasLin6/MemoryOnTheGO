//
//  SearchBar.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 2/1/26.
//

import SwiftUI
import VisualEffectBlurView

struct DeckSearchBar: View {
    @State var text: String = ""
    let items: [Deck]
    @Binding var filteredItems: [Deck]
    
    @FocusState.Binding var isTextFieldFocused: Bool
    
    var body: some View {
       
        ZStack {
            VisualEffectBlur(
                blurEffectStyle: .constant(.systemUltraThinMaterialDark),
                blurRadius: .constant(8)
            )
            .cornerRadius(10)
            .frame(height: 40)
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("search-bg"))
                .stroke(Color("search-outline"), lineWidth: 2)
                .frame(height: 40)
                .shadow(radius: 3)
                
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
