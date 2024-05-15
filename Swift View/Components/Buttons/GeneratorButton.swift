//
//  GenerateButton.swift
//  Swift View
//
//  Created by asia on 11/04/2024.
//

import SwiftUI

struct GeneratorButton: View {
    
    let action1: () -> Void
    let action2: () -> Void

    let title: String
   
    @Environment(Settings.self) var settingsModel
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    action1()
                    action2()
                }
                
                settingsModel.sensoryFeedback()
            }) {
                Text(title)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
             
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .controlSize(.large)
        .buttonStyle(.borderedProminent)
        .accessibilityLabel(Text("Press to generate a random exercise"))
    }
}



