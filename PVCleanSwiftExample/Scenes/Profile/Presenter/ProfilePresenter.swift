//
//  ProfilePresenter.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 28.03.2022.
//

import Foundation

// MARK: - Protocol

protocol ProfilePresentationLogic {
    func presentData(data: [ProfileResponse])
}

class ProfilePresenter {
    // MARK: - External vars
    weak var viewController: ProfileDisplayLogic?
}

extension ProfilePresenter: ProfilePresentationLogic {
    
    func presentData(data: [ProfileResponse]) {
        let viewModel = data.map { model -> ProfileViewModel in
            let profileModel = ProfileViewModel(name: model.name,
                                                dateBirth: model.dateBirth,
                                                phoneNumber: model.phoneNumber,
                                                email: model.email)

            return profileModel
        }
        viewController?.profileDetailsDisplay(data: viewModel)
    }

}

