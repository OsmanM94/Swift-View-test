//
//  AcessibillityGenerate.swift
//  Swift View
//
//  Created by asia on 02/05/2024.
//

import SwiftUI

struct LongPressGenerator: View {
    
    let action1: () -> Void
    let action2: () -> Void
    
    @Environment(Settings.self) var settingsModel
    
    var body: some View {
        VStack {
            Label("Generate", systemImage: "hand.tap")
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .foregroundStyle(.white)
        }
        .padding(.horizontal)
        .onLongPressGesture(minimumDuration: 2) {
            withAnimation {
                action1()
                action2()
            }
            settingsModel.sensoryFeedback()
        }
    }
}

