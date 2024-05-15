//
//  Contact .swift
//  Swift View
//
//  Created by asia on 17/04/2024.
//

import SwiftUI



struct FeedbackView: View {
    
   @State private var feedbackModel = Feedback()

    var body: some View {
        NavigationStack {
            Form {
                Section (header: Text("Contact Information"), footer:
                TextCard(description: "Any personal information collected from you is used solely for the purpose of responding to your feedback or inquiries. See Privacy Policy for more information.")) {
                    TextField("Name", text: $feedbackModel.name)
                        .textInputAutocapitalization(.never)
                    TextField("E-mail", text: $feedbackModel.email)
                        .textInputAutocapitalization(.never)
                }

                Section("Message") {
                    TextEditor(text: $feedbackModel.message)
                        .frame(height: 150)
                }

                Section {
                    Button("Send Feedback") {
                        self.feedbackModel.isShowingMailView.toggle()
                    }
                }
            }
            .navigationBarTitle("Feedback")
            .accessibilityLabel("Provide a feedback or let me know what feature you would like to be implemented.")
            .sheet(isPresented: $feedbackModel.isShowingMailView) {
                MailView(recipients: ["osmanmunur@yahoo.com"], subject: "Message from \(feedbackModel.name)", messageBody: feedbackModel.message)
            }
        }
    }
}

#Preview {
    FeedbackView()
}


