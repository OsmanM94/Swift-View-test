//
//  CustomModifiers.swift
//  Swift View
//
//  Created by asia on 27/04/2024.
//

import Foundation
import SwiftUI



extension Image {
    func aspectFill() -> some View {
        self
            .resizable()
            .scaledToFill()
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension Image {
    func aspectFit() -> some View {
        self
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func rectShadowBackground() -> some View {
        self
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .gray, radius: 5)
    }
}
