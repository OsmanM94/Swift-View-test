//
//  TimeLineBar.swift
//  Swift View
//
//  Created by asia on 19/04/2024.
//
import SwiftUI

struct EllipsisDots: View {
    
    let value: Bool
    let color: Color
    
    var body: some View {
        
        VStack {
            HStack {
                
                Text("hi")
                    .opacity(0)
                
                Spacer()
                
                Image(systemName: "ellipsis")
                    .foregroundStyle(color)
                    .symbolEffect(.variableColor.cumulative.hideInactiveLayers.nonReversing, options: .speed(1) .repeat(1), value: value)
                    .imageScale(.large)
                    .rotationEffect(.degrees(90))
            }
            .padding(.horizontal, 21)
        }
    }
}

