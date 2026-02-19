//
//  PresetLibrary.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 2/15/26.
//

import SwiftUI

struct PresetLibrary: View {
    @Binding var photoTmp: UniversalImage
    @Binding var showModal: Bool
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let presetPhotos = [
        UniversalImage.symbol("photo"),
        UniversalImage.symbol("eraser.slash"),
        UniversalImage.symbol("scribble.variable"),
        UniversalImage.symbol("pencil.and.scribble"),
        UniversalImage.symbol("highlighter"),
        UniversalImage.symbol("lasso"),
        UniversalImage.symbol("trash.slash"),
        UniversalImage.symbol("photo"),
        UniversalImage.symbol("eraser.slash"),
        
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("bg-purple-dark"), Color("bg-purple")], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                
                HStack {
                    Text("Image Library")
                        .font(.custom(Constants.Fonts.regular, size: 34))
                        .foregroundColor(Color("main-gray"))
                    Spacer()
                    CloseBtn(action: { showModal=false })
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .padding(.top, 10)
                LazyVGrid (columns: columns){
                    ForEach(presetPhotos) {photo in
                        Button{
                            photoTmp = photo
                            showModal = false
                        } label : {
                            UniversalImageView(source: photo)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                                .foregroundColor(Color("main-gray"))
                        }
                        
                    }
                }
                .padding()
                Spacer()
            }
            .padding(.top)
            
        }
    }
    
}

#Preview {
    PresetLibrary(photoTmp: .constant(UniversalImage.symbol("photo")), showModal: .constant(true))
}
