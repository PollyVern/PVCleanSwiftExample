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
        
        for i in 0...genres!.count-1 {
            genresResult.append(MovieGenresListResponse(name: genres![i].name))
        }
        return genresResult
    }
}
