//
//  MovieDetailsInteractor.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 28.03.2022.
//

import Foundation


protocol DetailsBusinessLogic {
    func loadMovieDetails()
}

protocol CreditsBusinessLogic {
    func loadMovieCredits()
}

protocol DetailsStoreProtocol: AnyObject {
    var movieID: Int { get set }
}

class MovieDetailsInteractor: DetailsStoreProtocol {
    var movieID: Int = 0
    var presenter = MovieDetailsPresenter()
    var detailsPresenter: MovieDetailsPresentationLogic?
    var creditsPresenter: MovieCreditsPresentationLogic?
    private let loadMovieDetailsWorker = LoadMovieDetailsWorker()
    private let loadMovieCreditsWorker = LoadMovieCreditsWorker()
}

extension MovieDetailsInteractor: DetailsBusinessLogic {
    func loadMovieDetails() {
        loadMovieDetailsWorker.loadMovieDetails(movieID: movieID) { movieDetailsListResponse in
            self.detailsPresenter?.presentData(data: movieDetailsListResponse)
        }
    }
}

extension MovieDetailsInteractor: CreditsBusinessLogic {
    func loadMovieCredits() {
        loadMovieCreditsWorker.loadMovieCredits(movieID: movieID) { movieCreditsListResponse in
            self.creditsPresenter?.presentData(data: movieCreditsListResponse)
        }
    }
    
}
