//
//  APIconstants.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 18.03.2022.
//

import Foundation

public struct APIconstants {
    static let APIkey = ProcessInfo.processInfo.environment["APIkey"] //Ключ API (v3 auth)
    static let baseUrl = "https://api.themoviedb.org/3/"
    static let baseImageW500URL = "https://image.tmdb.org/t/p/w500/"
}

