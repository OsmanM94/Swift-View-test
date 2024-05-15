//
//  SafeView.swift
//  Swift View
//
//  Created by asia on 10/04/2024.
//

import SwiftUI

struct SafeView: View {
    
    @Environment(Settings.self) var settingsModel
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading , spacing: 20) {
                
                GroupBoxCard(description: "A number of features already mentioned make Swift a safe language by helping you write code that is less likely to crash your app. Computer programs are very literal, and so code written to handle one thing may not be capable of handling another.")
       
                GroupBoxCard(description: "Type safety forces you to be explicit about the type of each object that you create, manipulate, assign and only lets you write code that the given object can handle. This prevents you from writing code that may crash if it is not designed to work with the types of objects you are referencing.")
                
                GroupBoxCard(description: "Type inference similarly allows the compiler to infer the type of an object, thereby saving you time and again ensuring that the compiler can enforce proper rules regarding what operations and functions can be performed with each type.")
                
                GroupBoxCard(description:  "Optionals are somewhat unique to Swift, and allow you to better express when a value may not exist. This helps you ensure that your code can handle both scenarios where values exist and scenarios where they do not exist. Swift also provides for sophisticated error handling, which as the name implies, allows you to write code that can handle errors gracefully and simply.")
                
                TextSource()
                
            }
            .navigationTitle("Safe")
            .font(settingsModel.largerText ? .title : .body)
            .fontWeight(settingsModel.boldText ? .bold : nil)
            .opacity(settingsModel.reduceTextBrightness ? 0.5 : 1)
            .padding([.top, .bottom])
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    SafeView()
        .environment(Settings())
}
