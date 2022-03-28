//
//  MovieDetailsInteractor.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 28.03.2022.
//

import Foundation


protocol DetailsBusinessLogic {
    func loadMovieDetails(movieID: MovieDetailsRequest)
}

protocol CreditsBusinessLogic {
    func loadMovieCredits(movieID: MovieDetailsRequest)
}

class MovieDetailsInteractor {
    var presenter = MovieDetailsPresenter()
    var detailsPresenter: MovieDetailsPresentationLogic?
    var creditsPresenter: MovieCreditsPresentationLogic?
    private let loadMovieDetailsWorker = LoadMovieDetailsWorker()
    private let loadMovieCreditsWorker = LoadMovieCreditsWorker()
}

extension MovieDetailsInteractor: DetailsBusinessLogic {
    func loadMovieDetails(movieID: MovieDetailsRequest) {
        loadMovieDetailsWorker.loadMovieDetails(movieID: movieID.movieId!) { movieDetailsListResponse in
            self.detailsPresenter?.presentData(data: movieDetailsListResponse)
        }
    }
}

extension MovieDetailsInteractor: CreditsBusinessLogic {
    func loadMovieCredits(movieID: MovieDetailsRequest) {
        loadMovieCreditsWorker.loadMovieCredits(movieID: movieID.movieId!) { movieCreditsListResponse in
            self.creditsPresenter?.presentData(data: movieCreditsListResponse)
        }
    }
    
    
}
