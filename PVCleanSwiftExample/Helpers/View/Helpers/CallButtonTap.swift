//
//  CallButtonTap.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 29.03.2022.
//

import UIKit

final class CallButtonTap {
    
    public func openCallFromURL(tel: String) {
       guard let url = URL(string: "tel://\(tel)") else { return }
            UIApplication.shared.open(url, options: [:], completionHandler:nil)
    }

}
