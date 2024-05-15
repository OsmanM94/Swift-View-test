//
//  ModernView.swift
//  Swift View
//
//  Created by asia on 10/04/2024.
//

import SwiftUI

struct ModernView: View {
    
    @Environment(Settings.self) var settingsModel
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading , spacing: 25) {
                
                GroupBoxCard(description: """
Clean syntax, which makes code readable and easier to work with.

Optionals, a new way of expressing when a value may not exist.

Type inference, which speeds up development and allows the compiler to help identify common issues.

Type safety, which enforces code that's less likely to crash your program.
""")
                
                GroupBoxCard(description: """
Automatic Reference Counting (ARC) for memory management, which automatically handles some of the deeper technical challenges of native programming.

Tuples and multiple return values, which allow smaller units of code to do more.

Generics, which help developers write code that can be used in multiple scenarios.
""")
                
                GroupBoxCard(description: """
Fast and concise iteration over collections, making Swift a fast language.

Structs that support methods, extensions, and protocols which allow Swift to optimize for memory use and speed while providing flexibility for developers.

Map, filter, reduce, and other functional programming patterns, which simplify code and streamline common actions that previously required multiple lines of code.

Powerful error handling, which helps the developer write fewer bugs and better handle scenarios that could cause apps to crash or perform unexpectedly.
""")
                
                TextSource()
            }
            .navigationTitle("Modern")
            .font(settingsModel.largerText ? .title : .body)
            .fontWeight(settingsModel.boldText ? .bold : nil)
            .opacity(settingsModel.reduceTextBrightness ? 0.5 : 1)
            .padding([.top, .bottom])
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ModernView()
            .environment(Settings())
    }
