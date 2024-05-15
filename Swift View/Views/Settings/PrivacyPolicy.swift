//
//  PrivacyPolicy.swift
//  Swift View
//
//  Created by asia on 17/04/2024.
//

import SwiftUI

struct PrivacyPolicy: View {
    
    @Environment(Settings.self) var settingsModel
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading, spacing: 20) {
                
                TextCard(description: "Swift View respects your privacy and is committed to protecting your personal information. This Privacy Policy explains how we collect, use, and safeguard your data when you use our app.")
                
                TextCard(description: "Information We Collect")
                    .modifier(HeaderTextModifier())
                
                TextCard(description: "We do not collect any personal information from you when you use our app. However, if you choose to provide feedback or contact us through the app, we may collect the following information:")
                
                TextCard(description: "- Name: We may collect your name if you choose to provide it when submitting feedback.")
                
                TextCard(description: "- Email Address: We may collect your email address if you choose to provide it when submitting feedback.")
                
                TextCard(description: "How We Use Your Information")
                    .modifier(HeaderTextModifier())
                
                TextCard(description: "Any personal information collected from you is used solely for the purpose of responding to your feedback or inquiries. We do not use your information for marketing purposes or share it with third parties.")
                
                TextCard(description: "Data Retention")
                    .modifier(HeaderTextModifier())
                
                TextCard(description: "We will retain your personal information only for as long as necessary to fulfill the purposes for which it was collected or as required by law.")
                
                TextCard(description: "Data Security")
                    .modifier(HeaderTextModifier())
                
                TextCard(description: "We take reasonable precautions to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, please be aware that no method of transmission over the internet or electronic storage is 100% secure.")
                
                TextCard(description: "Children's Privacy")
                    .modifier(HeaderTextModifier())
                
                TextCard(description: "Our app is not intended for use by children under the age of 13. We do not knowingly collect personal information from children under 13. If you are a parent or guardian and believe that your child has provided us with personal information, please contact us so that we can delete it.")
                
                TextCard(description: "Changes to This Privacy Policy")
                    .modifier(HeaderTextModifier())
                
                TextCard(description: "We may update our Privacy Policy from time to time. You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.")
                
                TextCard(description: "Contact Us")
                    .modifier(HeaderTextModifier())
                
                TextCard(description: "If you have any questions or concerns about this Privacy Policy, please contact us at osmanmunur@yahoo.com.")
            }
            .font(settingsModel.largerText ? .title : .body)
            .fontWeight(settingsModel.boldText ? .bold : nil)
            .opacity(settingsModel.reduceTextBrightness ? 0.5 : 1)
            .padding()
        }
        .navigationTitle("Privacy Policy")
        .accessibilityLabel("Privacy Policy")
    }
}

#Preview {
    PrivacyPolicy()
        .environment(Settings())
}
