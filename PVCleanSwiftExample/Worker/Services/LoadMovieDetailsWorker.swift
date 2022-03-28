//
//  LoadMovieDetailsWorker.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 28.03.2022.
//

import Foundation

struct LoadMovieDetailsWorker {

    private let loadGenresWorker = LoadGenresWorker()
    
    public func loadMovieDetails(movieID: Int, completion: @escaping (([MovieDetailsListResponse]) -> Void)) {
        var baseUrl: URL?
        var backendResponse = [MovieDetailsListResponse]()
        baseUrl = URL(string: APIconstants.baseUrl + "movie/\(movieID)")
        let url = baseUrl?.appending("api_key", value: APIconstants.APIkey)?.appending("language", value: "RU")

        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            guard let data = data else {
                return
            }
            do {
                let moviesDescriptionResult = try decoder.decode(MovieDetailsListResponse.self, from: data)
                backendResponse.append(MovieDetailsListResponse(title: moviesDescriptionResult.title,
                                                                runtime: moviesDescriptionResult.runtime,
                                                                backdropPath: moviesDescriptionResult.backdropPath,
                                                                genres: loadGenresWorker.loadGenres(genres: moviesDescriptionResult.genres),
                                                                overview: moviesDescriptionResult.overview,
                                                                voteAverage: moviesDescriptionResult.voteAverage))
                DispatchQueue.main.async {
                    completion(backendResponse)
                }

            } catch {
            }
        }.resume()
    }
}
