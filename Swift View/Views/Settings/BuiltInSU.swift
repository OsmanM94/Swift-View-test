//
//  SwiftUIView.swift
//  Swift View
//
//  Created by asia on 17/04/2024.
//

import SwiftUI

struct BuiltInSU: View {
    
    let images: [String] = ["PracticeScene", "PracticeScene2", "scenepractice"]
    
    @GestureState private var magnification: CGFloat = 1.0
    
    @Environment(Settings.self) var settingsModel
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack {
                    TabView {
                        ForEach(images, id: \.self) { image in
                            Image(decorative: image)
                                .resizable()
                                .scaledToFit()
                                .scaleEffect(magnification)
                                .gesture(
                                    MagnifyGesture()
                                        .updating($magnification) { value, gestureState, transaction in
                                            gestureState = value.magnification
                                        }
                                )
                                .overlay {
                                    HStack {
                                        Image(systemName: "square.arrowtriangle.4.outward")
                                    }
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                                    .alignment(.bottomTrailing)
                                    .padding(.horizontal, 40)
                                    .padding(.bottom)
                                }
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .always))
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
                    
                }
                .containerRelativeFrame(.vertical) { size, axis in
                    size * 0.5
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    TextCard(description: "Swift View was built entirely with SwiftUI framework.")
                        .font(.headline)
                        .foregroundStyle(.blue.gradient)
                    
                    TextCard(description: "SwiftUI provides a modern and declarative approach to building user interfaces across all Apple platforms.")
                    
                    TextCard(description: "With SwiftUI, you can create fluid and interactive UIs using simple and intuitive syntax, reducing the amount of boilerplate code and making development faster and more enjoyable.")
                    
                    TextCard(description: "Whether you're a beginner learning the basics of Swift or an experienced developer looking to leverage the latest technologies, SwiftUI empowers you to create stunning and responsive apps with ease.")
                }
                .font(settingsModel.largerText ? .title : .body)
                .fontWeight(settingsModel.boldText ? .bold : nil)
                .opacity(settingsModel.reduceTextBrightness ? 0.5 : 1)
                .padding()
            }
            .navigationTitle("Behind The Scenes")
            .accessibilityLabel("Highlights from building the app")
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    BuiltInSU()
        .environment(Settings())
}
