//
//  MovieDetailsListResponse.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 20.03.2022.
//

import Foundation

public struct MovieDetailsListResponse: Codable {
    let title: String?
    let runtime: Int?
    let backdropPath: String?
    let genres: [MovieGenresListResponse]?
    let overview: String?
    let voteAverage: Double?
}

extension MovieDetailsListResponse {

    func responseWithConvertedGenres() -> MovieDetailsListResponse {
        return MovieDetailsListResponse(title: self.title,
                                        runtime: self.runtime,
                                        backdropPath: self.backdropPath,
                                        genres: LoadGenresWorker().loadGenres(genres: self.genres),
                                        overview: self.overview,
                                        voteAverage: self.voteAverage)
    }
    
}

