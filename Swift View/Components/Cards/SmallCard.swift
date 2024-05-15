//
//  LargeCard.swift
//  Swift View
//
//  Created by asia on 07/04/2024.
//

import SwiftUI

struct SmallCard: View {
    let title: String
    let description: String
    let image: String
    
    @Environment(Settings.self) var settingsModel
    
    @GestureState private var magnification: CGFloat = 1.0
    
    @State private var value = false
    
    var body: some View {
        VStack(spacing: 25) {
        
            GroupBox(title) {
                Text(description)
                    .font(settingsModel.largerText ? .title : nil)
                    .fontWeight(settingsModel.boldText ? .bold : nil)
                    .opacity(settingsModel.reduceTextBrightness ? 0.5 : 1)
            }
            .groupBoxStyle(.textCard)
            
        }
        .padding(.horizontal)
       
       
        VStack {
            Image(decorative: image)
                .aspectFit()
                .overlay {
                    HStack {
                        Image(systemName: "square.arrowtriangle.4.outward")
                            .symbolEffect(.pulse.wholeSymbol, options: .speed(1) .repeat(2), value: value)
                    }
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                    .alignment(.topTrailing)
                    .padding(.horizontal, 10)
                    .padding(.top, 5)
                    .opacity(0.7)
                }
                .scaleEffect(magnification)
                .gesture(
                    MagnifyGesture()
                        .updating($magnification) { value, gestureState, transaction in
                            gestureState = value.magnification
                        }
                )
                .accessibilityLabel("Zoom image")
        }
        .onAppear {
            value.toggle()
        }
        .padding()
        .rectShadowBackground()
        .padding()
        
        Spacer()
    }
}

//#Preview {
//    MediumCard(title: "Dictionaries", description: "This is a sample description meant to show the text line spacing for the purpose of designing and getting a better feedback.", image: "operatorExample")
//        .environment(Settings())
//}



