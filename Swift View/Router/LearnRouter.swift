//
//  BasicsModel.swift
//  Swift View
//
//  Created by asia on 21/03/2024.
//

import Foundation
import SwiftUI

struct LearnRouter: Identifiable, Hashable {
    var id: Int
    var title: String
    var cardTitle: String
    var imageName: String
    var byOrder: String
}

extension LearnRouter {
    static let sampleData: [LearnRouter] = [
        LearnRouter(
            id: 1020,
            title: "Variables, Constants",
            cardTitle: "Variables and Constants",
            imageName: "variables",
            byOrder: "1.circle.fill"
        ),
        LearnRouter(
            id: 1021,
            title: "Operators",
            cardTitle: "Operators",
            imageName: "operators",
            byOrder: "2.circle.fill"
        ),
        LearnRouter(
            id: 1022,
            title: "String Interpolation",
            cardTitle: "String Interpolation",
            imageName: "interpolation",
            byOrder: "3.circle.fill"
        ),
        LearnRouter(
            id: 1023,
            title: "Control Flow",
            cardTitle: "Control Flow",
            imageName: "controlflow",
            byOrder: "4.circle.fill"
        ),
        LearnRouter(
            id: 1024,
            title: "Arrays",
            cardTitle: "Arrays",
            imageName: "arrays",
            byOrder: "5.circle.fill"
        ),
        LearnRouter(
            id: 1025,
            title: "Dictionaries",
            cardTitle: "Dictionaries",
            imageName: "dictionaries",
            byOrder: "6.circle.fill"
        ),
        LearnRouter(
            id: 1026,
            title: "For Loops",
            cardTitle: "For Loops",
            imageName: "forloops",
            byOrder: "7.circle.fill"
        ),
        LearnRouter(
            id: 1027,
            title: "While Loops",
            cardTitle: "While Loops",
            imageName: "whileloops",
            byOrder: "8.circle.fill"
        ),
        LearnRouter(
            id: 1028,
            title: "Functions",
            cardTitle: "Functions",
            imageName: "functions",
            byOrder: "9.circle.fill"
        ),
        LearnRouter(
            id: 1029,
            title: "Optionals",
            cardTitle: "Optionals",
            imageName: "optionals",
            byOrder: "10.circle.fill"
        ),
        LearnRouter(
            id: 1030,
            title: "Structs",
            cardTitle: "Structs",
            imageName: "structs",
            byOrder: "11.circle.fill"
        )
    ]
}

@ViewBuilder
func routingLearn(_ view: LearnRouter) -> some View {
    switch view.title {
    case "Variables, Constants":
         Variables()
    case "Operators":
         Operators()
    case "String Interpolation":
        StringInterpolation()
    case "Control Flow":
        ControlFlow()
    case "Arrays":
        Arrays()
    case "Dictionaries":
        Dictionaries()
    case "For Loops":
        ForLoops()
    case "While Loops":
        WhileLoops()
    case "Functions":
        Functions()
    case "Optionals":
        Optionals()
    case "Structs":
        Structs()
    default:
        ContentUnavailableView("Content Unavailable", systemImage: "xmark.circle")
    }
}
 
