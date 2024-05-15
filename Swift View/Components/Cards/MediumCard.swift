//
//  CardView.swift
//  Swift View
//
//  Created by asia on 06/04/2024.
//

import SwiftUI


struct MediumCard: View {
    
    let cardTitle: String
    let imageName: String
    let byOrder: String
    
    let imageCache = ImageCache.shared
    
    var body: some View {
        ZStack {
            
            if let cachedImage = imageCache.get(forKey: imageName) {
                Image(uiImage: cachedImage)
                    .aspectFill()
            } else {
                Image(decorative: imageName)
                    .aspectFill()
                    .onAppear {
                        if let image = UIImage(named: imageName) {
                            imageCache.set(image, forKey: imageName)
                        }
                    }
            }
        }
        .frame(width: 350, height: 450)
        .rectShadowBackground()
        .overlay {
            VStack {
                Image(systemName: byOrder)
                    .foregroundStyle(.white)
                    .font(.system(size: 25))
                    .alignment(.topLeading)
                    .padding()
                    .accessibilityLabel(Text("Follow the lesson order"))
                    
                Rectangle()
                    .fill(Color(.systemGray6))
                    .frame(width: 350, height: 60)
                    .clipShape(UnevenRoundedRectangle(bottomLeadingRadius: 20, bottomTrailingRadius: 20))
                    .overlay {
                        HStack {
                            Text(cardTitle)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .italic()
                                .padding(10)
                                .padding(.bottom, 6)
                                .alignment(.bottomLeading)
                            
                            Image(systemName: "chevron.right")
                                .fontWeight(.regular)
                                .font(.system(size: 17))
                                .accessibilityLabel(Text("Navigate to this lesson"))
                            
                        }
                        .padding(.horizontal, 15)
                    }
            }
        }
        .padding()
    }
}

//#Preview {
//    SmallCard(cardTitle: "Operators", imageName: "variables", byOrder: "1.circle.fill")
//}




