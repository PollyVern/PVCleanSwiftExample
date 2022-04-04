//
//  LoadGenresWorker.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 28.03.2022.
//

import Foundation

struct LoadGenresWorker {
    
    func loadGenres(genres: [MovieGenresListResponse]?) -> [MovieGenresListResponse] {
        var genresResult = [MovieGenresListResponse]()
        
        guard genres != nil else { return genresResult }
        
        for genre in genres! {
            genresResult.append(MovieGenresListResponse(name: genre.name))
        }
        return genresResult
    }
}
