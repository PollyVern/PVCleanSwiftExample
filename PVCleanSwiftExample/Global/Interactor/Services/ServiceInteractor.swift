//
//  ServiceInteractor.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 25.03.2022.
//

import Foundation

protocol BusinessLogic {
    func loadMovies()
}

protocol DetailsBusinessLogic {
    func loadMovieDetails(movieID: Int)
}

protocol CreditsBusinessLogic {
    func loadMovieCredits(movieID: Int)
}

public class ServiceInteractor: NSObject {
    var presenter: MoviesPresentationLogic?
    var details_presenter: MovieDetailsPresentationLogic?
    var credits_presenter: MovieCreditsPresentationLogic?
}

extension ServiceInteractor: BusinessLogic, XMLParserDelegate {
    
    public func loadMovies() {
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
                                                                  genres: self.loadGenres(genres: moviesDescriptionResult.genres),
                                                                  releaseDate: moviesDescriptionResult.releaseDate,
                                                                  runtime: moviesDescriptionResult.runtime))
                        self.presenter?.presentData(data: backendResponse)
                    }
                } catch {
                }
                
            }.resume()
        }
    }
}

extension ServiceInteractor: DetailsBusinessLogic {
    public func loadMovieDetails(movieID: Int) {
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
                                                                genres: self.loadGenres(genres: moviesDescriptionResult.genres),
                                                                overview: moviesDescriptionResult.overview,
                                                                voteAverage: moviesDescriptionResult.voteAverage))
                DispatchQueue.main.async {
                    self.details_presenter?.presentData(data: backendResponse)
                }
                
            } catch {
            }
        }.resume()
    }
}

extension ServiceInteractor: CreditsBusinessLogic {
    public func loadMovieCredits(movieID: Int) {
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
                    self.credits_presenter?.presentData(data: backendResponse)
                }
                
            } catch {
            }
        }.resume()
    }

}


extension ServiceInteractor {
    
    private func loadGenres(genres: [MovieGenresListResponse]?) -> [MovieGenresListResponse] {
        var genresResult = [MovieGenresListResponse]()
        if genres == nil {
            return genresResult
        } else {
            for i in 0...genres!.count-1 {
                genresResult.append(MovieGenresListResponse(name: genres![i].name))
            }
            return genresResult
        }
    }
}


