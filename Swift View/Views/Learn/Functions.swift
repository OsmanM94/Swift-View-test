//
//  Functions.swift
//  Swift View
//
//  Created by asia on 21/03/2024.
//

import SwiftUI

struct Functions: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(Learn.functions, id: \.id) { item in
                    SmallCard(title: item.title, description: item.description, image: item.image)
                }
            }
        }
    }
}


