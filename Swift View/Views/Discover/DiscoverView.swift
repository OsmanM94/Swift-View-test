//
//  DiscoverView.swift
//  Swift View
//
//  Created by Osman M. on 21/03/2024.
//

import SwiftUI

struct DiscoverView: View {
    
    var body: some View {
        NavigationStack {
            DiscoverDashboard()
                .navigationTitle("Discover")
                .accessibilityLabel("Learn more about the Origin of Swift")
        }
    }
}

#Preview {
    DiscoverView()
        .environment(Settings())
}

struct DiscoverDashboard: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(DiscoverRouter.sampleData, id: \.id) { item in
                    NavigationLink(value: item) {
                        LargeCard(imageName: item.imageName, cardTitle: item.cardTitle, subTitle: item.subTitle)
                    }
                }
            }
            .buttonStyle(.plain)
            .navigationDestination(for: DiscoverRouter.self) { item in
                routingDiscover(item)
            }
        }
    }
}

