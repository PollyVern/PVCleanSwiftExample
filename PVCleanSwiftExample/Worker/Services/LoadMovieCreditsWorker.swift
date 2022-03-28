//
//  LoadMovieCreditsWorker.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 28.03.2022.
//

import Foundation

struct LoadMovieCreditsWorker {
    
    public func loadMovieCredits(movieID: Int, completion: @escaping (([MovieCreditsListResponse]) -> Void)) {
        var baseUrl: URL?
        var backendResponse = [MovieCreditsListResponse]()
        
        baseUrl = URL(string: APIconstants.baseUrl + "movie/\(movieID)/credits")
        let url = baseUrl?.appending("api_key", value: APIconstants.APIkey)?.appending("language", value: "RU")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            guard let data = data else {
                return
            }
            do {
                let movieCreditsResult = try decoder.decode(MovieCreditsListResponse.self, from: data)
                backendResponse.append(MovieCreditsListResponse(cast: movieCreditsResult.cast,
                                                                crew: movieCreditsResult.crew))
                DispatchQueue.main.async {
                    completion(backendResponse)
                }
                
            } catch {
            }
        }.resume()
    }
    
}
