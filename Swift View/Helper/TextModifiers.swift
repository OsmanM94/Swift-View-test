//
//  StandardText.swift
//  Swift View
//
//  Created by asia on 31/03/2024.
//

import SwiftUI

let deviceBg = #colorLiteral(red: 0.1256825924, green: 0.133513391, blue: 0.1729713678, alpha: 1)

struct ExerciseTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.bottom, 40)
            .padding(.horizontal)
            .lineSpacing(3)
    }
}

struct InterfaceModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding([.top, .bottom])
            .background(Color(deviceBg))
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .font(.title3)
            .fontDesign(.monospaced)
            .padding(.horizontal, 5)
    }
}


struct HeaderTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .fontWeight(.semibold)
    }
}

struct HeaderTextModifier2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .fontWeight(.semibold)
    }
}

struct HintExamplesTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .fontWeight(.regular)
            .padding()
            .background((.gray.opacity(0.2)))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
    }
}








