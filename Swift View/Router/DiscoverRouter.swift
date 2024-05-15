//
//  DiscoverRouter.swift
//  Swift View
//
//  Created by asia on 10/04/2024.
//

import Foundation
import SwiftUI

struct DiscoverRouter: Identifiable, Hashable {
    var id: Int
    var title: String
    var imageName: String
    var cardTitle: String
    var subTitle: String
}

extension DiscoverRouter {
    static let sampleData: [DiscoverRouter] = [
        DiscoverRouter(
            id: 1040,
            title: "History",
            imageName: "history",
            cardTitle: "History",
            subTitle: "Explore the origin of Swift"
        ),
        DiscoverRouter(
            id: 1041,
            title: "Modern",
            imageName: "modern",
            cardTitle: "Modern",
            subTitle: "Discover why it's modern"
        ),
        DiscoverRouter(
            id: 1042,
            title: "Safe",
            imageName: "safe",
            cardTitle: "Safe",
            subTitle: "Learn why it's safe"
        )
        
    ]
}

@ViewBuilder
func routingDiscover(_ view: DiscoverRouter) -> some View {
    switch view.title {
    case "History":
        HistoryView()
    case "Modern":
        ModernView()
    case "Safe":
        SafeView()
    default:
        ContentUnavailableView("Content Unavailable", systemImage: "xmark.circle")
    }
}
