//
//  Xcircle.swift
//  Swift View
//
//  Created by asia on 25/04/2024.
//

import SwiftUI

struct Xmark: View {
    
    let action: String
    let value: Bool
    
    var body: some View {
        Image(systemName: action)
            .foregroundStyle(.gray)
            .font(.system(size: 30))
            .symbolEffect(.bounce.down.wholeSymbol, value: value)
           
    }
}

