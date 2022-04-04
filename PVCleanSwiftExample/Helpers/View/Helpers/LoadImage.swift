//
//  LoadImage.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 25.03.2022.
//

import UIKit

final class LoadImages {

    public func loadImageW500(partOfURL: String, completion: @escaping ((UIImage)->Void)) {
        var baseUrl: URL?
        baseUrl = URL(string: APIconstants.baseImageW500URL + partOfURL)
        URLSession.shared.dataTask(with: baseUrl!) { (data, response, error) in
            guard let data = data, error == nil else { return }

            DispatchQueue.main.async() {
                completion((UIImage(data: data) ?? UIImage(systemName: "film.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))?.withRenderingMode(.alwaysOriginal).withTintColor(.gray))!)
            }
        }.resume()
    }
 
}
