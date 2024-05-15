//
//  Swift_ViewApp.swift
//  Swift View
//
//  Created by asia on 21/03/2024.
//

import SwiftUI

@main
struct Swift_ViewApp: App {
    
    @State private var settingsModel = Settings()
    
    var body: some Scene {
        WindowGroup {
            TabViews()
                .environment(settingsModel)
//                .onAppear {
//                    settingsModel.haptic.toggle()
//                }
        }
    }
}
