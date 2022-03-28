//
//  ProfileInteractor.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 28.03.2022.
//

import Foundation

protocol ProfileBusinessLogic {
    func loadDataProfile(data: ProfileRequest)
}

public class ProfileInteractor: NSObject {
    var presenter: ProfilePresentationLogic?
}

extension ProfileInteractor: ProfileBusinessLogic {
    
    func loadDataProfile(data: ProfileRequest) {
        var backendResponse = [ProfileResponse]()
        backendResponse.append(ProfileResponse(name: data.name, dateBirth: data.dateBirth, phoneNumber: data.phoneNumber, email: data.email))
        self.presenter?.presentData(data: backendResponse)
    }

}
