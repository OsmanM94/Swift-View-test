//
//  SettingsView.swift
//  Swift View
//
//  Created by Osman M. on 03/04/2024.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(Settings.self) var settingsModel
   
    var body: some View {
        ZStack {
            if settingsModel.showSplash {
                SettingsSubView(settingsModel: settingsModel)
                    
            }
            else {
                SplashView()
                    
            }
            
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.settingsModel.showSplash = true
                }
            }
        })
    }
}

#Preview {
    SettingsView()
        .environment(Settings())
}

struct SettingsSubView: View {
    
    @Bindable var settingsModel: Settings
 
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Practice") , footer: Text("Enable sensory feedback across the Practice View.")) {
                    Toggle(
                        "Haptic Feedback",
                        systemImage: "iphone.gen1.radiowaves.left.and.right",
                        isOn: $settingsModel.haptic
                    )
                }
                
                Section(footer: Text("Save battery life")) {
                    Toggle(
                        "Save Battery",
                        systemImage: "battery.50percent",
                        isOn: $settingsModel.batterySaver
                    )
                }
                .onChange(of: settingsModel.batterySaver) {
                    settingsModel.enableBatterySaver()
                }
                
                DisclosureGroup("Appearance") {
                    Toggle(
                        "Light",
                        systemImage: "sun.max",
                        isOn: $settingsModel.lightMode
                    )
                    .onChange(of: settingsModel.lightMode) {
                        settingsModel.checkSystemScheme()
                        withAnimation {
                            settingsModel.showSplashAfterSchemeChange()
                        }
                    }
                    Toggle(
                        "Dark",
                        systemImage: "moon",
                        isOn: $settingsModel.darkMode
                    )
                    .onChange(of: settingsModel.darkMode) {
                        settingsModel.checkSystemScheme()
                        withAnimation {
                            settingsModel.showSplashAfterSchemeChange()
                            }
                    }
                    Toggle(
                        "System",
                        systemImage: "iphone",
                        isOn: $settingsModel.systemScheme
                    )
                    .onChange(of: settingsModel.systemScheme) { 
                        settingsModel.checkSystemScheme()
                    }
                }
               
                DisclosureGroup("Accessibility") {
                    Toggle(
                        "Larger Text",
                        systemImage:"textformat.size",
                        isOn: $settingsModel.largerText
                    )
                    Toggle(
                        "Bold Text",
                        systemImage:"bold",
                        isOn: $settingsModel.boldText
                    )
                    Toggle(
                        "Reduce Text Brightness",
                        systemImage:"eye.circle",
                        isOn: $settingsModel.reduceTextBrightness
                    )
                    Toggle(
                        "Navigation Haptic",
                        systemImage:"hand.tap",
                        isOn: $settingsModel.navigationHaptic
                    )
                    Toggle(
                        "Long Press Generator",
                        systemImage:"hand.tap",
                        isOn: $settingsModel.longPressGenerator
                    )
                    TextCard(description: "The Long Press Generator is aimed at people who have arm or hand nerve damage. It enables the generation of exercises on longer taps.")
                        .font(.subheadline)
                        
                }
                
                Section("Support and resources") {
                    
                    NavigationLink {
                        FeedbackView()
                    } label: {
                        Label("Feedback", systemImage: "envelope")
                    }
                    
                    NavigationLink {
                        BuiltInSU()
                    } label: {
                        Label("Built in SwiftUI", systemImage: "square.grid.2x2")
                    }
                }
                
                Section("Legal") {
                    
                    NavigationLink {
                        Disclaimer()
                    } label: {
                        Label("Disclaimer", systemImage: "doc")
                    }
                    NavigationLink {
                        PrivacyPolicy()
                    } label: {
                        Label("Privacy Policy", systemImage: "shield.lefthalf.filled")
                    }
                }
                
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Settings")
            .accessibilityLabel("Explore app settings")
        }
    }
}
