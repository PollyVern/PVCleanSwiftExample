//
//  ContainerViewController.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 25.03.2022.
//

import UIKit

class ContainerViewController: UIViewController {
    
    // MARK: - Internal var
    var isExpanded: Bool = false
    override var prefersStatusBarHidden: Bool {
        return isExpanded
    }
    
    // MARK: - Internal UI var
    var centerController: UIViewController!
    let blackOpacityView = UIView()
    
    // MARK: - External var
    var profileController: ProfileViewController!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
}

extension ContainerViewController {
    // MARK: - Helpers
    private func configure() {
        configureHomeController()
        configureBlackOpacityView()
    }
    
    private func configureHomeController() {
        let homeController = MoviesViewController()
        homeController.delegate = self
        centerController = UINavigationController(rootViewController: homeController)
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    private func configureProfileController() {
        if profileController == nil {
            profileController = ProfileViewController()
            profileController.delegate = self
            view.insertSubview(profileController.view, at: 0)
            addChild(profileController)
            profileController.didMove(toParent: self)
        }
    }
    
    private func configureBlackOpacityView() {
        blackOpacityView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        blackOpacityView.frame = CGRect(x: view.frame.width-80, y: 0, width: 200, height: view.frame.height)
    }
    
    private func showProfileController(shouldExpand: Bool) {
        if shouldExpand {
            let duration = 0.5
            DispatchQueue.main.async {
                UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                    self.centerController.view.frame.origin.x = (self.centerController.view.frame.width - 80)
                }
            }

            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
                self.view.addSubview(self.blackOpacityView)
            }
            
        } else {
            self.blackOpacityView.removeFromSuperview()
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
                self.centerController.view.frame.origin.x = 0
            }
        }
        animateStatusBar()
    }
    
    
    private func animateStatusBar() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            self.setNeedsStatusBarAppearanceUpdate()
        } completion: { (_) in }

    }
}

// MARK: - MoviesViewControllerDelegate
extension ContainerViewController: MoviesViewControllerDelegate {
    func handleToggle() {
        if !isExpanded {
            configureProfileController()
        }
        isExpanded = !isExpanded
        showProfileController(shouldExpand: isExpanded)
    }
}

