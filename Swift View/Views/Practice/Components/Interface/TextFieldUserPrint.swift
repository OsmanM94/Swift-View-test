//
//  TextFieldUserPrint.swift
//  Swift View
//
//  Created by asia on 15/04/2024.
//

import SwiftUI

struct TextFieldUserPrint: View {
    
    @Bindable var normalModel: NormalModel
    
    var body: some View {
        TextField("", text: Binding (
            get: {
                self.normalModel.exercise.userPrint ?? ""
            },
            set: { newValue in
                self.normalModel.exercise.userPrint = newValue.isEmpty ? nil : newValue
            }
        ), prompt: Text("Print to Console").foregroundStyle(.gray) )
        .modifier(TextFieldModifier())
        .submitLabel(.done)
        .foregroundStyle(.purple)
        .onTapGesture {
            withAnimation {
                normalModel.isTapped = true
            }
        }
        .onSubmit {
            normalModel.solutionValidator()
            normalModel.consoleValidator()
            withAnimation {
                normalModel.isTapped = false
            }
        }
        .accessibilityLabel(Text("Print your solution in the console."))
    }
}

#Preview {
    TextFieldUserPrint(normalModel: NormalModel())
}
