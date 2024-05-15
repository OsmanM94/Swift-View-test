//
//  InterfaceDots.swift
//  Swift View
//
//  Created by asia on 30/04/2024.
//

import SwiftUI

struct InterfaceDots: View {
    var body: some View {
        
        HStack {
            Circle()
                .foregroundStyle(.red)
            Circle()
                .foregroundStyle(.yellow)
            Circle()
                .foregroundStyle(.green)
        }
        .frame(height: 15)
        
        Divider()
        
    }
}

