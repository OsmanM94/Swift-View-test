//
//  RestartText.swift
//  Swift View
//
//  Created by asia on 26/04/2024.
//

import SwiftUI

struct RestartTextButton: View {
    
    let action1: () -> Void
    
    var body: some View {
        VStack {
            Button {
                action1()
            } label: {
                Image(systemName: "memories")
                    .font(.title)
            }
        }
        .buttonStyle(.plain)
        .accessibilityLabel("Restart the exercise")
    }
}

