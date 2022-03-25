//
//  MovieCreditsListResponse.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 21.03.2022.
//

import Foundation

public struct MovieCreditsListResponse: Codable {
    let cast: [Cast]?
    let crew: [Crew]?
}

public struct Cast: Codable {
    let originalName: String?
}

public struct Crew: Codable {
    let originalName: String?
}

