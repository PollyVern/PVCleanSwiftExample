//
//  ProfileViewController.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 25.03.2022.
//

import UIKit
import MessageUI

// MARK: - Protocol
protocol ProfileDisplayLogic: AnyObject {
    func profileDetailsDisplay(data: [ProfileViewModel])
}

class ProfileViewController: UIViewController {
    
    // MARK: - External var
//    var delegate: MoviesViewControllerDelegate?
    private var interactor: ProfileBusinessLogic?
    private var profileData = [ProfileViewModel]()
    
    // MARK: - Internal UI var
    lazy var profileView: ProfileView = {
        var view = ProfileView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
            
    // MARK: - Lifecycle
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
    // MARK: - constraint
    private func configureProfileView() {
        view.addSubview(profileView)
        profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.frame.width * 0.2)).isActive = true
        profileView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        profileView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension ProfileViewController: ProfileDisplayLogic {
    
    func profileDetailsDisplay(data: [ProfileViewModel]) {
        profileData.removeAll()
        profileData.append(contentsOf: data)
        profileView.setup(data: profileData[0])
        profileView.delegate = self
    }
 
}

extension ProfileViewController: MailComposePresent {
    func mailErrorAlert(alert: UIAlertController) {
        self.present(alert, animated: true, completion: nil)
    }
    
    func mailPresent(mailCompose: MFMailComposeViewController) {
        self.present(mailCompose, animated: true, completion: nil)
    }
    
}

//extension ProfileViewController {
//
//    @objc func tapCloseButton() {
//        delegate?.handleToggle()
//    }
//}
