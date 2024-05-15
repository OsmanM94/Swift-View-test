//
//  HintButton.swift
//  Swift View
//
//  Created by asia on 25/04/2024.
//

import SwiftUI

struct HintButton: View {
    let action1: () -> Void
    
    @Environment(Settings.self) var settingsModel
    
    var body: some View {
        Button(action: {
            action1()
            
            settingsModel.sensoryFeedback()
        }) {
            Image(systemName: "lightbulb.fill")
            .font(.system(size: 22))
            .foregroundStyle(.orange)
        }
        .accessibilityLabel(Text("See hints and best practices"))
    }
}


