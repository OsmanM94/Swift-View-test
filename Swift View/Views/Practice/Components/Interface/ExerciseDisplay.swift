//
//  ExercisesDisplay.swift
//  Swift View
//
//  Created by asia on 25/04/2024.
//

import SwiftUI

struct ExerciseDisplay: View {
    
    let action1: String
    
    @Environment(Settings.self) var settingsModel
    
    var body: some View {
        Text(action1)
            .foregroundStyle(.white)
            .font(settingsModel.largerText ? .title : nil)
            .fontWeight(settingsModel.boldText ? .bold : nil)
            .modifier(ExerciseTextModifier())
            .opacity(settingsModel.reduceTextBrightness ? 0.5 : 1)
    }
}


