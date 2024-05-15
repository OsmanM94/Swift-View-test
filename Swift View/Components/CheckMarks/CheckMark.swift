//
//  CheckMark.swift
//  Swift View
//
//  Created by asia on 11/04/2024.
//

import SwiftUI

struct CheckMark: View {
    
    @Environment(Settings.self) var settingsModel
    
    let action: String
    let color: Color
    
    var body: some View {
        Image(systemName: action)
            .font(.system(size: 28))
            .foregroundStyle(color)
            .contentTransition(.symbolEffect(.replace.upUp.wholeSymbol))
            .onChange(of: action) {
                settingsModel.sensoryFeedback()
            }
    }
}




