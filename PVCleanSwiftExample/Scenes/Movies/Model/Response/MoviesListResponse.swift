//
//  MoviesListResponse.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 17.03.2022.
//

import Foundation

public struct MoviesListResponse: Codable {
    let id: Int!
    let voteAverage: Double?
    let posterPath: String?
    let title: String?
    let genres: [MovieGenresListResponse]?
    let releaseDate: String?
    let runtime: Int?
}

extension MoviesListResponse {

    func responseWithConvertedGenres() -> MoviesListResponse {
        return MoviesListResponse(id: self.id,
                                  voteAverage: self.voteAverage,
                                  posterPath: self.posterPath,
                                  title: self.title,
                                  genres: LoadGenresWorker().loadGenres(genres: self.genres),
                                  releaseDate: self.releaseDate,
                                  runtime: self.runtime)
    }
    
}
