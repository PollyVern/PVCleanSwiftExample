//
//  UIApplication.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 25.03.2022.
//

import UIKit

extension UIApplication {
    
    static var statusBarHeight: CGFloat {
        let window = shared.windows.filter { $0.isKeyWindow }.first
        return window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    }
}
