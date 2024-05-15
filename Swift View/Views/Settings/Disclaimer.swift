//
//  DisclaimerView.swift
//  Swift View
//
//  Created by asia on 17/04/2024.
//

import SwiftUI

struct Disclaimer: View {
    
    @Environment(Settings.self) var settingsModel
    
    var body: some View {
        
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading, spacing: 20) {
                
                TextCard(description: "This app is developed by an independent developer and is not associated with Apple Inc. or the Swift programming language in any way. Any reference to Apple, Swift, or related trademarks is for informational purposes only and does not imply endorsement or affiliation with Apple Inc. All product and company names are trademarks™ or registered® trademarks of their respective holders. Use of them does not imply any affiliation with or endorsement by them.")
                
                
                TextCard(description: "Swift View is designed to teach the basics of the Swift programming language for educational purposes only. The information provided within the app is intended for general informational purposes and should not be considered professional advice.")
                
                
                TextCard(description: "While we strive to provide accurate and up-to-date information, we make no representations or warranties of any kind, express or implied, about the completeness, accuracy, reliability, suitability, or availability of the information contained within the app.")
                
                
                TextCard(description: "Any reliance you place on such information is strictly at your own risk. We shall not be held responsible for any loss or damage, including but not limited to, direct, indirect, incidental, consequential, or punitive damages arising from the use of, or inability to use, the information provided in the app.")
                
                
                TextCard(description: "We do not take any liability with respect to any loss or damage caused or alleged to be caused directly or indirectly by the information contained in this app, including but not limited to, loss of data, profits, or business interruption.")
                
                
                TextCard(description: "It is important to note that the information provided in the app may not cover all aspects or scenarios of Swift programming, and users are encouraged to seek additional resources and consult with qualified professionals for specific advice and guidance.")
                
            }
            .font(settingsModel.largerText ? .title : .body)
            .fontWeight(settingsModel.boldText ? .bold : nil)
            .opacity(settingsModel.reduceTextBrightness ? 0.5 : 1)
            .padding()
        }
        .scrollIndicators(.hidden)
        .accessibilityLabel("Disclaimer")
        .navigationTitle("Disclaimer")
        .accessibilityLabel("Disclaimer")
    }
}

#Preview {
    Disclaimer()
        .environment(Settings())
}
