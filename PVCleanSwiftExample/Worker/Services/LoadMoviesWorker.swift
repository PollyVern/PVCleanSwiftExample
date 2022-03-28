//
//  LoadMoviesWorker.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 25.03.2022.
//

import Foundation

struct LoadMoviesWorker {

    private let loadGenresWorker = LoadGenresWorker()
    
    func loadMovies(completion: @escaping (([MoviesListResponse]) -> Void)) {
        var baseUrl: URL?
        var backendResponse = [MoviesListResponse]()
        
        for i in 0...MoviesDefaultListRequest.moviesIDList.count-1 {
            baseUrl = URL(string: APIconstants.baseUrl + "movie/\(MoviesDefaultListRequest.moviesIDList[i])")
            let url = baseUrl?.appending("api_key", value: APIconstants.APIkey)?.appending("language", value: "RU")
            
            URLSession.shared.dataTask(with: url!) { (data, response, error) in
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                guard let data = data else {return}
                do {
                    let moviesDescriptionResult = try decoder.decode(MoviesListResponse.self, from: data)
                    DispatchQueue.main.async {
                        backendResponse.append(MoviesListResponse(id: moviesDescriptionResult.id,
                                                                  voteAverage: moviesDescriptionResult.voteAverage,
                                                                  posterPath: moviesDescriptionResult.posterPath,
                                                                  title: moviesDescriptionResult.title,
                                                                  genres: loadGenresWorker.loadGenres(genres: moviesDescriptionResult.genres),
                                                                  releaseDate: moviesDescriptionResult.releaseDate,
                                                                  runtime: moviesDescriptionResult.runtime))
                        completion(backendResponse)
                    }
                } catch {
                }
                
            }.resume()
        }
    }
}
