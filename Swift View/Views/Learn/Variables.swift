//
//  VariablesView.swift
//  Swift View
//
//  Created by asia on 21/03/2024.
//

import SwiftUI

struct Variables: View {
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 30) {
                ForEach(Learn.variables, id: \.id) { item in
                    SmallCard(title: item.title, description: item.description, image: item.image)
                }
            }
        }
    }
}





