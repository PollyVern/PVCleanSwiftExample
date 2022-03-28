//
//  MailButtonTap.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 29.03.2022.
//

import MessageUI

final class MailButtonTap: NSObject, MFMailComposeViewControllerDelegate {
    
    func openMailCompose(mail: String, completion: @escaping ((MFMailComposeViewController) -> Void), errorCompletion: @escaping ((UIAlertController) -> Void)) {
        let mailComposerViewController = configureMailController(mail: mail)
        if MFMailComposeViewController.canSendMail() {
            completion(mailComposerViewController)
        } else {
            let mailErrorAlert = UIAlertController(title: "ОШИБКА", message: "Для того, чтобы написать письмо, скачайте почтовый клиент\nот Apple 'Почта'\nили\nнапишите в телеграмм @polina_belovodskaya", preferredStyle: .alert)
            let mailErrorDismiss = UIAlertAction(title: "Ok", style: .default, handler: nil)

            mailErrorAlert.addAction(mailErrorDismiss)
            
            errorCompletion(mailErrorAlert)
        }
    }
    
    private func configureMailController(mail: String) -> MFMailComposeViewController {
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        mailComposer.setToRecipients([mail])
        mailComposer.setSubject("Хороший день")
        return mailComposer
    }


    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
