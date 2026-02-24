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
        GridItem(.flexible())
    ]
    
    let trainNames = [

        "1-1-train",
        "1-4-train",
        "1-7-train",
        "1-A-train",
        "1-F-train",
        "1-G-train",
        "1-J-train",
        "1-L-train",
        "1-R-train",
        "1-W-train",
        
        "1-14-St",
        "1-18-St",
        "1-23-St",
        "1-28-St",
        "1-34-St-Penn-Station",
        "1-42-St-Times-Sq",
        "1-50-St",
        "1-59-St-Columbus-Circle",
        "1-66-St-Lincoln-Center",
        "1-72-St",
        "1-79-St",
        "1-Canal-St",
        "1-Chambers-St",
        "1-Christopher-St",
        "1-Franklin-St",
        "1-Houston-St",
        "1-Rector-St",
        "1-South-Ferry",
        "1-WTC-Cortlandt",
        
        "4-14-St-Union-Sq",
        "4-59-St",
        "4-86-St",
        "4-125-St",
        "4-149-St-Grand-Concourse",
        "4-161-St-Yankee-Stadium",
        "4-167-St",
        "4-170-St",
        "4-176-St",
        "4-183-St",
        "4-Bedford-Pk-Blvd-Lehman-College",
        "4-Brooklyn-Bridge-City-Hall",
        "4-Burnside-Ave",
        "4-Fordham-Rd",
        "4-Fulton-St",
        "4-Grand-Central-42-St",
        "4-Mosholu-Pkwy",
        "4-Mt-Eden-Ave",
        "4-Woodlawn",
        
        "7-33-St-Rawson-St",
        "7-40-St-Lowery-St",
        "7-46-St-Bliss-St",
        "7-52-St",
        "7-61-St-Woodside",
        "7-69-St",
        "7-74-St-Broadway",
        "7-82-St-Jackson-Hts",
        "7-90-St-Elmhurst-Ave",
        "7-103-St-Corona-Plaza",
        "7-111-St",
        "7-Court-Sq",
        "7-Flushing-Main-St",
        "7-Grand-Central-42-St",
        "7-Hunters-Point-Ave",
        "7-Junction-Blvd",
        "7-Mets-Willets-Pt",
        "7-Queensboro-Plaza",
        "7-Vernon-Blvd-Jackson-Ave",
        
        "A-14-St",
        "A-34-St-Penn-Station",
        "A-42-St-Port-Authority",
        "A-59-St-Columbus-Circle",
        "A-125-St",
        "A-145-St",
        "A-168-St",
        "A-175-St",
        "A-181-St",
        "A-190-St",
        "A-Canal-St",
        "A-Chambers-St",
        "A-Dyckman-St",
        "A-Fulton-St",
        "A-High-St",
        "A-Inwood-207-St",
        "A-Jay-St-Metrotech",
        "A-Nostrand-Ave",
        "A-W-4-St-Washington-Sq",
        
        "F-2-Ave",
        "F-5-Ave-53-St",
        "F-14-St",
        "F-23-St",
        "F-34-St-Herald-Sq",
        "F-42-St-Bryant-Pk",
        "F-47-50-Sts-Rockefeller-Ctr",
        "F-75-Ave",
        "F-Broadway-Lafayette-St",
        "F-Delancey-St-Essex-St",
        "F-East-Broadway",
        "F-Forest-Hills-71-Ave",
        "F-Jackson-Hts-Roosevelt-Ave",
        "F-Kew-Gardens-Union-Tpke",
        "F-Lexington-Ave-53-St",
        "F-Queens-Plaza",
        "F-W-4-St-Wash-Sq",
        "F-York-St",
        "F-Court-Sq-23-St",
        
        "J-Alabama-Ave",
        "J-Bowery",
        "J-Broad-St",
        "J-Broadway-Junction",
        "J-Canal-St",
        "J-Chambers-St",
        "J-Chauncey-St",
        "J-Cleveland-St",
        "J-Delancey-St-Essex-St",
        "J-Flushing-Ave",
        "J-Fulton-St",
        "J-Gates-Ave",
        "J-Halsey-St",
        "J-Hewes-St",
        "J-Kosciuszko-St",
        "J-Lorimer-St",
        "J-Marcy-Ave",
        "J-Myrtle-Av",
        "J-Van-Siclen-Ave",
        
        "G-4-Ave-9-Sts",
        "G-7-Ave",
        "G-15-St-Prospect-Park",
        "G-21-St",
        "G-Bedford-Notstrand-Aves",
        "G-Bergen-St",
        "G-Broadway",
        "G-Carroll-St",
        "G-Classon-Ave",
        "G-Clinton-Washington-Aves",
        "G-Court-Sq",
        "G-Flushing-Ave",
        "G-Fulton-St",
        "G-Greenpoint-Ave",
        "G-Hoyt-Schermerhorn",
        "G-Metropolitan-Ave",
        "G-Myrtle-Willoughby-Aves",
        "G-Nassau-Ave",
        "G-Smith-9-Sts",
        
        "L-1-Ave",
        "L-3-Ave",
        "L-6-Ave",
        "L-8-Ave",
        "L-14-St-Union-Sq",
        "L-Atlantic-Ave",
        "L-Bedford-Ave",
        "L-Broadway-Junction",
        "L-Bushwick-Ave-Aberdeen-St",
        "L-Dekalb-Ave",
        "L-Graham-Ave",
        "L-Halsey-St",
        "L-Jefferson-St",
        "L-Lorimer-St",
        "L-Montrose-Ave",
        "L-Morgan-Ave",
        "L-Myrtle-Wyckoff-Aves",
        "L-Sutter-Ave",
        "L-Wilson-Ave",
        "L-Grand-St",
        
        "R-4-Ave-9-St",
        "R-25-St",
        "R-36-St",
        "R-45-St",
        "R-53-St",
        "R-59-St",
        "R-77-St",
        "R-86-St",
        "R-Atlantic-Ave-Barclays-Center",
        "R-Bay-Ridge-95-St",
        "R-Bay-Ridge-Ave",
        "R-Cortlandt-St",
        "R-Court-St",
        "R-DeKalb-Ave",
        "R-Jay-St-Metrotech",
        "R-Prospect-Ave",
        "R-Rector-St",
        "R-Union-St",
        "R-Whitehall-St-South-Ferry",
        
        "W-5-Ave-59-St",
        "W-8-St-NYU",
        "W-14-St-Union-Sq",
        "W-23-St",
        "W-28-St",
        "W-30-Ave",
        "W-34-St-Herald-Sq",
        "W-36-Ave",
        "W-39-Ave",
        "W-49-St",
        "W-57-St-7-Ave",
        "W-Astoria-Blvd",
        "W-Astoria-Ditmars-Blvd",
        "W-Broadway",
        "W-Canal-St",
        "W-Lexington-Ave-59-St",
        "W-Prince-St",
        "W-Queensboro-Plaza",
        "W-Times-Sq-42-St",
        "W-City-Hall"
    ]
    
    var presetPhotos: [UniversalImage] {
        trainNames.map { UniversalImage.asset($0) }
    }
    
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
                .padding(.horizontal, 20)
                .padding(.top, 10)
                ScrollView {
                    LazyVGrid (columns: columns){
                        ForEach(presetPhotos) {photo in
                            Button{
                                photoTmp = photo
                                showModal = false
                            } label : {
                                UniversalImageView(source: photo)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 165)
                                    .frame(maxHeight: 225)
                                    .foregroundColor(Color("main-gray"))
                            }
                            .padding(.bottom, 5)
                            
                        }
                    }
                    .padding()
                }
                
                
                Spacer()
            }
            .padding(.top)
            
        }
    }
    
}

#Preview {
    PresetLibrary(photoTmp: .constant(UniversalImage.symbol("photo")), showModal: .constant(true))
}
