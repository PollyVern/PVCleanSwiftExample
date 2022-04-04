//
//  LoadMoviesWorker.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 25.03.2022.
//

import Foundation

struct LoadMoviesWorker {

    func loadMovies(completion: @escaping (([MoviesListResponse]) -> Void)) {
        var baseUrl: URL?
        var backendResponse = [MoviesListResponse]()
        
        for movieId in MoviesDefaultListRequest.moviesIDList {
            baseUrl = URL(string: APIconstants.baseUrl + "movie/\(movieId)")
            let url = baseUrl?.appending("api_key", value: APIconstants.APIkey)?.appending("language", value: "RU")
            URLSession.shared.dataTask(with: url!) { (data, response, error) in
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                guard let data = data else {return}
                do {
                    let moviesDescriptionResult = try decoder.decode(MoviesListResponse.self, from: data)
                    
                    DispatchQueue.main.async {
                        backendResponse.append(moviesDescriptionResult.responseWithConvertedGenres())
                        completion(backendResponse)
                    }
                } catch {
                }
                
            }.resume()
        }
    }
}
