//
//  ProfileViewController.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 25.03.2022.
//

import UIKit

//MARK: - Protocol
protocol ProfileDisplayLogic: AnyObject {
    func profileDetailsDisplay(data: [ProfileViewModel])
}

class ProfileViewController: UIViewController {
    
    //MARK: - External var
    var delegate: MoviesViewControllerDelegate?
    private var interactor: ProfileBusinessLogic?
    private var profileData = [ProfileViewModel]()
    
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
    
    //MARK: - Lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        interactor?.loadDataProfile(data: ProfileRequest())
        configureProfileView()
        view.backgroundColor = UIColor(ColorConstants.backgroundColor)
    }
    
    private func setup() {
        let viewController = self
        let presenter = ProfilePresenter()
        let interactor = ProfileInteractor()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
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
        
//        button.addTarget(self, action: #selector(tapCallButton), for: .touchUpInside)
//        profileView.emailButton.addTarget(self, action: #selector(tapSendButton), for: .touchUpInside)
//        profileView.closeButton.addTarget(self, action: #selector(tapCloseButton), for: .touchUpInside)
    }
}

extension ProfileViewController: ProfileDisplayLogic {
    
    func profileDetailsDisplay(data: [ProfileViewModel]) {
        profileData.removeAll()
        profileData.append(contentsOf: data)
        profileView.setup(data: profileData[0])
    }
    
    
}

//extension ProfileViewController {
//
//    //MARK: - Actions: Other
//@objc private func tapCallButton() {
//    if let url = URL(string: "tel://\(ProfileViewModel().phoneNumber)"),
//       UIApplication.shared.canOpenURL(url) {
//        UIApplication.shared.open(url, options: [:], completionHandler:nil)
//    }
//}
//
//    @objc func tapCloseButton() {
//        delegate?.handleToggle()
//    }
//}


//extension ProfileViewController: MFMailComposeViewControllerDelegate {
//
//    //MARK: - Actions: Mail
//    private func configureMailController() -> MFMailComposeViewController {
//        let mailComposer = MFMailComposeViewController()
//        mailComposer.mailComposeDelegate = self
//        mailComposer.setToRecipients(["\(ProfileViewModel().email)"])
//        mailComposer.setSubject("Хороший день")
//        return mailComposer
//    }
//
//    private func mailErrorMessage() {
//        let mailErrorAlert = UIAlertController(title: "ОШИБКА", message: "Для того, чтобы написать письмо, скачайте почтовый клиент\nот Apple 'Почта'\nили\nнапишите в телеграмм @polina_belovodskaya", preferredStyle: .alert)
//        let mailErrorDismiss = UIAlertAction(title: "Ok", style: .default, handler: nil)
//
//        mailErrorAlert.addAction(mailErrorDismiss)
//
//        self.present(mailErrorAlert, animated: true, completion: nil)
//    }
//
//    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
//        controller.dismiss(animated: true, completion: nil)
//    }
//
//    @objc func tapSendButton() {
//        let mailComposerViewController = configureMailController()
//        if MFMailComposeViewController.canSendMail() {
//            self.present(mailComposerViewController, animated: true, completion: nil)
//        } else {
//            mailErrorMessage()
//        }
//    }
//}

