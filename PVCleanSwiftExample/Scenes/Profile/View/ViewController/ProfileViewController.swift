//
//  ProfileViewController.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 25.03.2022.
//

import UIKit
import MessageUI

class ProfileViewController: UIViewController {
    
    //MARK: - External var
    var delegate: MoviesViewControllerDelegate?
    
    //MARK: - Internal UI var
    lazy var profileView: ProfileView = {
        var view = ProfileView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    //MARK: - Lifecycle
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureProfileView()
        view.backgroundColor = UIColor(ColorConstants.backgroundColor)
    }
}

extension ProfileViewController {
    //MARK: - constraint
    private func configureProfileView() {
        view.addSubview(profileView)
        profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.frame.width * 0.2)).isActive = true
        profileView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        profileView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        profileView.callButton.addTarget(self, action: #selector(tapCallButton), for: .touchUpInside)
        profileView.emailButton.addTarget(self, action: #selector(tapSendButton), for: .touchUpInside)
        profileView.closeButton.addTarget(self, action: #selector(tapCloseButton), for: .touchUpInside)
    }
}

extension ProfileViewController {
    
    //MARK: - Actions: Other
    @objc private func tapCallButton() {
        if let url = URL(string: "tel://\(ProfileViewModel().phoneNumber)"),
           UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler:nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    @objc func tapCloseButton() {
        delegate?.handleToggle()
    }
}


extension ProfileViewController: MFMailComposeViewControllerDelegate {
    
    //MARK: - Actions: Mail
    private func configureMailController() -> MFMailComposeViewController {
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        mailComposer.setToRecipients(["\(ProfileViewModel().email)"])
        mailComposer.setSubject("Хороший день")
        return mailComposer
    }
    
    private func mailErrorMessage() {
        let mailErrorAlert = UIAlertController(title: "ОШИБКА", message: "Для того, чтобы написать письмо, скачайте почтовый клиент\nот Apple 'Почта'\nили\nнапишите в телеграмм @polina_belovodskaya", preferredStyle: .alert)
        let mailErrorDismiss = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        mailErrorAlert.addAction(mailErrorDismiss)
        
        self.present(mailErrorAlert, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    @objc func tapSendButton() {
        let mailComposerViewController = configureMailController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposerViewController, animated: true, completion: nil)
        } else {
            mailErrorMessage()
        }
    }
}

