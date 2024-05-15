//
//  KeyboardHelper.swift
//  Swift View
//
//  Created by asia on 30/04/2024.
//

import SwiftUI

struct KeyboardHelper: View {
    
    let action: () -> Void
    let label: String
    
    var body: some View {
        Button(action: {
           action()
        }, label: {
            Text(label)
        })
    }
}


