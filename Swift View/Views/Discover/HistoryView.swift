//
//  OriginView.swift
//  Swift View
//
//  Created by asia on 09/04/2024.
//

import SwiftUI

struct HistoryView: View {
    
    @Environment(Settings.self) var settingsModel
    
    var body: some View {
        
        ScrollView(.vertical) {
            
            LazyVStack(alignment: .leading , spacing: 25) {
                
                GroupBoxCard(description: "At the Apple Worldwide Developers 2014, Apple introduced Swift as a modern language for writing apps for iOS and macOS. Apple now has new platforms, including watchOS and tvOS, that also use Swift as the primary programming language.")
                
                
                GroupBoxCard(description:  "Since the 1990s, most developers have written applications for Apple platforms in Objective-C, a language built on top of the C programming language. Objective-C is more than 30 years old, and C is more than 40 years old. Both languages have served the software developer community well. They won't be going away in the foreseeable future.")
                
                GroupBoxCard(description: "However, Objective-C can be challenging to learn. Because technology has been advancing so fast in recent years, Apple saw the opportunity to create a more modern language that was easier to read, write and maintain.")
                
                GroupBoxCard(description: "As you learn Swift, you may see the influence of its C and Objective-C heritage.")
                
                TextSource()
                
            }
            .navigationTitle("History")
            .font(settingsModel.largerText ? .title : .body)
            .fontWeight(settingsModel.boldText ? .bold : nil)
            .opacity(settingsModel.reduceTextBrightness ? 0.5 : 1)
            .padding([.top, .bottom])
            
            
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    HistoryView()
        .environment(Settings())
}
