//
//  MovieDetailsInteractor.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 28.03.2022.
//

import Foundation


protocol DetailsBusinessLogic {
    func loadMovieDetails(movieID: Int)
}

protocol CreditsBusinessLogic {
    func loadMovieCredits(movieID: Int)
}

class MovieDetailsInteractor {
    var presenter = MovieDetailsPresenter()
    var detailsPresenter: MovieDetailsPresentationLogic?
    var creditsPresenter: MovieCreditsPresentationLogic?
    private let loadMovieDetailsWorker = LoadMovieDetailsWorker()
    private let loadMovieCreditsWorker = LoadMovieCreditsWorker()
}

extension MovieDetailsInteractor: DetailsBusinessLogic {
    func loadMovieDetails(movieID: Int) {
        loadMovieDetailsWorker.loadMovieDetails(movieID: movieID) { movieDetailsListResponse in
            self.detailsPresenter?.presentData(data: movieDetailsListResponse)
        }
    }
}

extension MovieDetailsInteractor: CreditsBusinessLogic {
    func loadMovieCredits(movieID: Int) {
        loadMovieCreditsWorker.loadMovieCredits(movieID: movieID) { movieCreditsListResponse in
            self.creditsPresenter?.presentData(data: movieCreditsListResponse)
        }
    }
    
    
}
