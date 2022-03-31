//
//  MoviesRouter.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 31.03.2022.
//

import Foundation
import UIKit

protocol MoviesRoutingLogic {
    func navigateToDetails(movieID: Int)
}

class MoviesRouter {
    weak var viewController: UIViewController?
}

extension MoviesRouter: MoviesRoutingLogic {
        
    func navigateToDetails(movieID: Int) {
        let movieDetailsVC = MovieDetailsViewController()
        movieDetailsVC.modalPresentationStyle = .overCurrentContext
        movieDetailsVC.modalTransitionStyle = .crossDissolve
        movieDetailsVC.statusBarHeight = UIApplication.statusBarHeight
        movieDetailsVC.router?.dataStore?.movieID = movieID
        viewController?.present(movieDetailsVC, animated: true)
    }
    
    
}
