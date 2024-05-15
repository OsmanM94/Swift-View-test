//
//  Legend.swift
//  Swift View
//
//  Created by asia on 26/04/2024.
//

import SwiftUI

struct LegendIcon: View {
    
    let iconName: String
    let color: Color
    let imageSize: CGFloat
    
    var body: some View {
        
        Image(systemName: iconName)
            .foregroundStyle(color)
            .font(.system(size: imageSize))
            
    }
}

struct LegendGenerateIcon: View {
    
    let title: String
    let backgroundColor: Color
    let padding: CGFloat
    let horizontalPadding: CGFloat
    let color: Color
    let cornerRadius: CGFloat
    
    var body: some View {
        Text(title)
            .font(.system(size: 15))
            .foregroundStyle(color)
            .padding(padding)
            .padding(.horizontal, horizontalPadding)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius ))
    }
}

struct LegendRunIcon: View {
    
    let title: String
    let padding: CGFloat
    
    var body: some View {
        Text(title)
            .font(.system(size: 10))
            .foregroundStyle(.white)
            .fontWeight(.semibold)
            .padding(padding)
            .background(Color.orange)
            .clipShape(Circle())
            
    }
}
