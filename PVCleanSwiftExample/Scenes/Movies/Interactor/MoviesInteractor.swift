//
//  MoviesInteractor.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 28.03.2022.
//

import Foundation

protocol BusinessLogic {
    func loadMovies()
}

class MoviesInteractor {
    var presenter: MoviesPresentationLogic?
    private var loadMoviesWorker = LoadMoviesWorker()
}

extension MoviesInteractor: BusinessLogic {

    public func loadMovies() {
        loadMoviesWorker.loadMovies { moviesListResponse in
            self.presenter?.presentData(data: moviesListResponse)
        }
    }
}
