//
//  MoviesPresenter.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 25.03.2022.
//

import Foundation

// MARK: - Protocol
protocol MoviesPresentationLogic {
    func presentData(data: [MoviesListResponse])
}

class MoviesPresenter {
    
    // MARK: - External vars
    weak var viewController: MoviesDisplayLogic?
}


// MARK: - MoviesPresentationLogic
extension MoviesPresenter: MoviesPresentationLogic {
    public func presentData(data: [MoviesListResponse]) {
        let viewModel = data.map { model -> MoviesCoverCollectionViewCellModel in
            let cellModel = MoviesCoverCollectionViewCellModel(id: model.id,
                                                               name: model.title ?? "Неизвестно",
                                                               posterPath: model.posterPath ?? "",
                                                               genres: presentGenresString(model: model),
                                                               date: Formatters().dateFormatter(dateString: model.releaseDate ?? ""),
                                                               runtime: Formatters().minutesToHoursFormatter(dataMinutes: model.runtime ?? 0),
                                                               voteAverage: "\(model.voteAverage ?? 0.0)" )
            return cellModel
        }
        viewController?.display(data: viewModel)
    }
}

extension MoviesPresenter {
    // MARK: - Helpers
    private func presentGenresString(model: MoviesListResponse) -> String {
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
}
