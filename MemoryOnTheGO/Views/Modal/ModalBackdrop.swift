//
//  ModalBackdrop.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 1/25/26.
//

import SwiftUI

struct ModalBackdrop: View {
    @Binding var toggleModal: Bool
    
    @State private var toggleModalOpacity: CGFloat = 0
    
    var body: some View {
        Rectangle()
            .fill(.black)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onTapGesture {
                toggleModal = false
            }
            .ignoresSafeArea()
            .opacity(toggleModalOpacity)
            .onChange(of: toggleModal) { _, newVal in
                withAnimation(.easeInOut(duration: 0.25)) {
                    toggleModalOpacity = newVal ? 0.3 : 0
                }
            }
    }
}

#Preview {
    ModalBackdrop(toggleModal: .constant(true))
}
