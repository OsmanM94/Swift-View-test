//
//  Source.swift
//  Swift View
//
//  Created by asia on 27/04/2024.
//

import SwiftUI

struct TextSource: View {
    
    var body: some View {
        
        HStack {
            Text("Source:   Develop in Swift Fundamentals")
                .fontWeight(.bold)
                .padding(.horizontal, 25)
                .italic()
                .textSelection(.enabled)
            
            Spacer()
            
            Link(destination: URL(string: "https://books.apple.com/gb/book/develop-in-swift-fundamentals/id6468967906")!) {
                Image(systemName: "arrow.up.right.square.fill")
                    .font(.title)
                    .foregroundStyle(.blue)
            }
            
        }
        .padding(.horizontal)
    }
}

//#Preview {
//    TextSource()
//}


