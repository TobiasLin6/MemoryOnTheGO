//
//  UploadPhotoModal.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 1/25/26.
//

import SwiftUI

struct UploadPhotoModal: View {
    
    @Binding var showPhotoModal: Bool
    @Binding var photo: UniversalImage
    
    @State private var mainOffset: CGFloat = 1000
    @State private var gestureOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                ZStack {
                    DefaultModalBackground(height: Constants.uploadPhotoModalHeight)
                    VStack {
                        HStack {
                            ModalTitle(title:"Upload Photo")
                                .offset(x: 40)
                            Spacer()
                            CloseBtn(action: {showPhotoModal = false})
                                .padding()
                        }
                        .padding(.bottom, 20)
                        
                        HStack {
                            GhostBtn(title: "Open Photos", horizPadding: 55, onTap: {})
                            Spacer()
                                .frame(width: 30)
                            GhostBtn(title: "Take Photo", horizPadding: 55, onTap: {})
                        }
                        .padding(.bottom, 10)
                        GhostBtn(title: "Pick from Library", horizPadding: 100, onTap: {})
                        
                        UniversalImageView(source: photo)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                        
                        SubmitBtn(title: "Done", onTap: {})
                            .padding(.bottom, 50)
                    }
                    .padding(.horizontal, 10)
                }
            }
            .ignoresSafeArea()
            
        }
        .gesture(DragGesture(coordinateSpace: .global)
            .onChanged { value in
                if mainOffset < 50 && value.translation.height > -10 {
                    gestureOffset = value.translation.height
                }
            }
            .onEnded { value in
                withAnimation(.spring()) {
                    if gestureOffset > 150 {
                        showPhotoModal = false
                    }
                    gestureOffset = 0
                }
            }
        )
        .offset(y: mainOffset + gestureOffset)
        .onAppear {
            withAnimation(.spring()){
                mainOffset = showPhotoModal ? 15.0 : 1000
            }
        }
        .onChange(of:showPhotoModal){ _, newVal in
            withAnimation(.spring()) {
                mainOffset = newVal ? 15.0 : 1000
            }
        }
        
    }
}

#Preview {
    UploadPhotoModal(showPhotoModal: .constant(true), photo: .constant(UniversalImage.symbol("photo")))
}
