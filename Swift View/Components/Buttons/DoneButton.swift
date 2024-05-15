//
//  DoneButton.swift
//  Swift View
//
//  Created by asia on 25/04/2024.
//

import SwiftUI

struct DoneButton: View {
    let action1: () -> Void
    let action2: () -> Void
    
    var body: some View {
        Button(action: {
            withAnimation {
                action1()
                action2()
            }
        }, label: {
            Text("Done")
                .fontWeight(.semibold)
        })
    }
}


