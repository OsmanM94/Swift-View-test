//
//  MediumCard.swift
//  Swift View
//
//  Created by asia on 08/04/2024.
//

import SwiftUI

struct LargeCard: View {
    let imageName: String
    let cardTitle: String
    let subTitle: String
    
    var body: some View {
            ScrollView {
                ZStack {
                    Image(decorative: imageName)
                        .aspectFit()
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                        }
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        Text(cardTitle)
                            .foregroundStyle(.white)
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.bottom, 5)
                            
                        Text(subTitle)
                            .font(.title3)
                            .foregroundStyle(.white)
                            .italic()
                    }
                    .alignment(.bottomLeading)
                    .padding()
                    .background(
                        LinearGradient(
                            colors: [
                                .black.opacity(0),
                                .black.opacity(0.6)
                                    ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    )
                    .padding(.horizontal, 25)
                }
                .frame(width: 400, height: 450)
                .padding()
                .navigationTitle("Discover")
                .accessibilityLabel(Text("Learn more about Swift"))
        }
    }
}

//#Preview {
//    LargeCard(imageName: "safe", cardTitle: "A Safe Language", subTitle: "Why is safe?")
//}


