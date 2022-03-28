//
//  CallButtonTap.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 29.03.2022.
//

import UIKit

final class CallButtonTap {
    
    public func openCallFromURL(tel: String) {
        if let url = URL(string: "tel://\(tel)"),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler:nil)
        }
    }

}
