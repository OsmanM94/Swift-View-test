//
//  GroupBox.swift
//  Swift View
//
//  Created by asia on 01/05/2024.
//

import SwiftUI

struct GroupBoxCard: View {
    
    let description: String
    
    var body: some View {
        
        GroupBox {
            Text(description)
        }
        .padding(.horizontal)
        .groupBoxStyle(.textCard)
        
        
    }
}

struct TextBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
                .bold()
                .font(.title3)
                .padding(.bottom, 5)
            configuration.content
        }
        .padding()
        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 12))
    }
}

extension GroupBoxStyle where Self == TextBoxStyle {
    static var textCard: TextBoxStyle { .init() }
}
