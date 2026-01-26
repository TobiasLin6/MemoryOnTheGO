//
//  UploadPhotoModal.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 1/25/26.
//

import SwiftUI
import PhotosUI

struct UploadPhotoModal: View {
    
    @Binding var showPhotoModal: Bool
    @Binding var photo: UniversalImage
    
    @State private var photoTmp: UniversalImage = UniversalImage.symbol("photo")
    @State private var showingCamera = false
    @State private var selectedItem: PhotosPickerItem?
    
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
                            
                            PhotosPicker(selection: $selectedItem,
                                         matching: .images,
                                         photoLibrary: .shared()) {
                                Text("Open Photos")
                                    .font(.custom(Constants.Fonts.regular, size: 22))
                                    .foregroundColor(Color("main-gray"))
                                    .padding(.horizontal, 55)
                                    .frame(height: 65)
                                    .background {
                                        RoundedRectangle(cornerRadius: 33)
                                            .fill(.clear)
                                            .stroke(Color("text-field-bg"), lineWidth: 3)
                                    }
                            }
                                         .onChange(of: selectedItem) { _ , newItem in
                                             if let newItem = newItem {
                                                 Task{
                                                     if let data = try? await newItem.loadTransferable(type: Data.self) {
                                                         photoTmp = UniversalImage.imageData(data)
                                                     }
                                                 }
                                             }
                                         }

                            
                            Spacer()
                                .frame(width: 30)
                            GhostBtn(title: "Take Photo", horizPadding: 55, onTap: {showingCamera = true})
                                .sheet(isPresented: $showingCamera) {
                                    CameraView(image: $photoTmp)
                                }
                        }
                        .padding(.bottom, 10)
                        GhostBtn(title: "Pick from Library", horizPadding: 100, onTap: {
                            // TODO: Add pick from library
                        })
                        
                        UniversalImageView(source: photoTmp)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .padding(10)
                        
                        SubmitBtn(title: "Done", onTap: {
                            photo = photoTmp
                            showPhotoModal = false
                        })
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
            photoTmp = UniversalImage.symbol("photo")
        }
        
    }
}

#Preview {
    UploadPhotoModal(showPhotoModal: .constant(true), photo: .constant(UniversalImage.symbol("photo")))
}
