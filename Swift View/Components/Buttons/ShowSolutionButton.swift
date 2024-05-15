//
//  ShowSolutionButton.swift
//  Swift View
//
//  Created by asia on 25/04/2024.
//

import SwiftUI

struct ShowSolutionButton: View {
    let action1: () -> Void
    let action2: () -> Void
    
    let title: String
    
    var body: some View {
        Button(action: {
            withAnimation {
                action1()
                action2()
            }
        }) {
            Text(title)

        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .controlSize(.regular)
        .buttonStyle(.borderedProminent)
        .accessibilityLabel("Show the exercise solution")
    }
}

#Preview {
    ShowSolutionButton(action1: { }, action2: { }, title: "Show Solution")
}
