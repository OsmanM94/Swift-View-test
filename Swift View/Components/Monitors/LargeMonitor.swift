//
//  LargeMonitor.swift
//  Swift View
//
//  Created by asia on 02/05/2024.
//

import SwiftUI

struct LargeMonitor: View {
    var body: some View {
        VStack {
            Image(systemName: "display")
                .font(.system(size: 350, weight: .ultraLight))
                
        }
    }
}

#Preview {
    LargeMonitor()
        .environment(Settings())
}
