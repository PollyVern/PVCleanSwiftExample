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



//
//protocol DetailsBusinessLogic {
//    func loadMovieDetails(movieID: Int)
//}
//
//protocol CreditsBusinessLogic {
//    func loadMovieCredits(movieID: Int)
//}
//
//public class ServiceWorker: NSObject {
////    
////    var detailsPresenter: MovieDetailsPresentationLogic?
////    var creditsPresenter: MovieCreditsPresentationLogic?
//}
//

//
//extension ServiceWorker: DetailsBusinessLogic {
//    public func loadMovieDetails(movieID: Int) {
//        var baseUrl: URL?
//        var backendResponse = [MovieDetailsListResponse]()
//        baseUrl = URL(string: APIconstants.baseUrl + "movie/\(movieID)")
//        let url = baseUrl?.appending("api_key", value: APIconstants.APIkey)?.appending("language", value: "RU")
//    
//        URLSession.shared.dataTask(with: url!) { (data, response, error) in
//            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
//            guard let data = data else {
//                return
//            }
//            do {
//                let moviesDescriptionResult = try decoder.decode(MovieDetailsListResponse.self, from: data)
//                backendResponse.append(MovieDetailsListResponse(title: moviesDescriptionResult.title,
//                                                                runtime: moviesDescriptionResult.runtime,
//                                                                backdropPath: moviesDescriptionResult.backdropPath,
//                                                                genres: self.loadGenres(genres: moviesDescriptionResult.genres),
//                                                                overview: moviesDescriptionResult.overview,
//                                                                voteAverage: moviesDescriptionResult.voteAverage))
//                DispatchQueue.main.async {
////                    self.detailsPresenter?.presentData(data: backendResponse)
//                }
//                
//            } catch {
//            }
//        }.resume()
//    }
//}
//
//extension ServiceWorker: CreditsBusinessLogic {
//    public func loadMovieCredits(movieID: Int) {
//        var baseUrl: URL?
//        var backendResponse = [MovieCreditsListResponse]()
//        baseUrl = URL(string: APIconstants.baseUrl + "movie/\(movieID)/credits")
//        let url = baseUrl?.appending("api_key", value: APIconstants.APIkey)?.appending("language", value: "RU")
//        
//        URLSession.shared.dataTask(with: url!) { (data, response, error) in
//            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
//            guard let data = data else {
//                return
//            }
//            do {
//                let movieCreditsResult = try decoder.decode(MovieCreditsListResponse.self, from: data)
//                backendResponse.append(MovieCreditsListResponse(cast: movieCreditsResult.cast,
//                                                                crew: movieCreditsResult.crew))
//                DispatchQueue.main.async {
////                    self.creditsPresenter?.presentData(data: backendResponse)
//                }
//                
//            } catch {
//            }
//        }.resume()
//    }
//
//}
//
//
