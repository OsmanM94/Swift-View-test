//
//  Feedback.swift
//  Swift View
//
//  Created by asia on 02/05/2024.
//

import Foundation
import SwiftUI
import MessageUI


@Observable
final class Feedback {
   var name: String = ""
   var email: String = ""
   var message: String = ""
   var isShowingMailView: Bool = false
    
}


struct MailView: UIViewControllerRepresentable {
    typealias UIViewControllerType = MFMailComposeViewController

    let recipients: [String]
    let subject: String
    let messageBody: String

    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.setToRecipients(recipients)
        vc.setSubject(subject)
        vc.setMessageBody(messageBody, isHTML: false)
        vc.mailComposeDelegate = context.coordinator
        return vc
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
}

class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
