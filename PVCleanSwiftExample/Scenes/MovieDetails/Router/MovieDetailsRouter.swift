//
//  MovieDetailsRouter.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 31.03.2022.
//

import Foundation

protocol MovieDetailsRoutingLogic {
    
}

protocol MovieDetailsDataPassingProtocol {
    var dataStore: DetailsStoreProtocol? { get }
}

class MovieDetailsRouter: MovieDetailsDataPassingProtocol {
    weak var dataStore: DetailsStoreProtocol?
}

extension MovieDetailsRouter: MovieDetailsRoutingLogic {
    
}
