//
//  Structs.swift
//  Swift View
//
//  Created by asia on 21/03/2024.
//

import SwiftUI

struct Structs: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(Learn.structs, id: \.id) { item in
                    SmallCard(title: item.title, description: item.description, image: item.image)
                }
            }
        }
    }
}

