//
//  MovieDetailsPresenter.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 25.03.2022.
//

import Foundation

//MARK: - Protocol
protocol MovieDetailsPresentationLogic {
    func presentData(data: [MovieDetailsListResponse])
}

protocol MovieCreditsPresentationLogic {
    func presentData(data: [MovieCreditsListResponse])
}

class MovieDetailsPresenter {
    //MARK: - External vars
    weak var viewController: MovieDetailsDisplayLogic?
}

//MARK: - MovieDetailsPresentationLogic
extension MovieDetailsPresenter: MovieDetailsPresentationLogic {
    public func presentData(data: [MovieDetailsListResponse]) {
        let viewModel = data.map { model -> MovieDetailsViewModel in
            let model = MovieDetailsViewModel(runtime: "\(model.runtime ?? 0) мин",
                                              name: model.title ?? "Неизвестно",
                                              backdropPath: model.backdropPath ?? "",
                                              genres: presentGenresString(model: model),
                                              description: model.overview,
                                              starsVoteAverage: countStarsFromVoteAverage(model: model))
            return model
        }
        viewController?.movieDetailsDisplay(data: viewModel)
    }
}

//MARK: - MovieCreditsPresentationLogic
extension MovieDetailsPresenter: MovieCreditsPresentationLogic {
    public func presentData(data: [MovieCreditsListResponse]) {
        let viewModel = data.map { model -> MovieCreditsViewModel in
            let model = MovieCreditsViewModel(directors: presentDirectorsString(model: model),
                                              stars: presentStarsString(model: model))
            return model
            
        }
        viewController?.movieCreditsDisplay(data: viewModel)
    }
    
    
}

extension MovieDetailsPresenter {
    //MARK: - Helpers
    private func presentGenresString(model: MovieDetailsListResponse) -> String {
        var genresArray = [String]()
        
        if model.genres?.count == 0 {
            return ""
        } else {
            for i in 0...model.genres!.count-1 {
                genresArray.append(model.genres![i].name!)
            }
            let genresString = (genresArray.map{$0}).map{String($0)}.joined(separator: ", ")
            return genresString
        }
    }
    
    private func presentDirectorsString(model: MovieCreditsListResponse) -> String {
        var directorsArray = [String]()
        
        if model.crew?.count == 0 {
            return ""
        } else {
            for i in 0...1 {
                directorsArray.append(model.crew![i].originalName!)
            }
            let directorsString = (directorsArray.map{$0}).map{String($0)}.joined(separator: ", ")
            return directorsString
        }
    }
    
    private func presentStarsString(model: MovieCreditsListResponse) -> String {
        var starsArray = [String]()
        
        if model.cast?.count == 0 {
            return ""
        } else {
            for i in 0...1 {
                starsArray.append(model.cast![i].originalName!)
            }
            let starsString = (starsArray.map{$0}).map{String($0)}.joined(separator: ", ")
            return starsString
        }
    }
    
    private func countStarsFromVoteAverage(model: MovieDetailsListResponse) -> Int {
        let vote = Int(model.voteAverage ?? 0)
        
        if vote >= 0 && vote <= 2 {
            return 1
        } else if vote >= 2 && vote <= 4 {
            return 2
        } else if vote >= 4 && vote <= 6 {
            return 3
        } else if vote >= 6 && vote <= 8 {
            return 4
        } else if vote >= 9 && vote <= 10 {
            return 5
        }
        return Int(0)
    }
}

