//
//  TabView.swift
//  Swift View
//
//  Created by asia on 21/03/2024.
//

import SwiftUI

struct TabViews: View {
    
    @State private var selectedTab: Int = 0
    
    @Environment(Settings.self) var settingsModel
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            LearnView()
                .tabItem {
                    Label("Learn", systemImage: "info.circle.fill")
                }
                .tag(0)
            
            PracticeView()
                .tabItem {
                    Label("Practice", systemImage: "display")
                }
                .tag(1)
            
           DiscoverView()
                .tabItem {
                    Label("Discover", systemImage: "star.fill")
                }
                .tag(2)
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(3)
        }
        .preferredColorScheme(settingsModel.darkMode ? .dark : nil)
        .preferredColorScheme(settingsModel.lightMode ? .light : nil)
        .onChange(of: selectedTab) {
            settingsModel.navigationSensoryFeedback()
        }
    }
}

#Preview {
    TabViews()
        .environment(Settings())
}


