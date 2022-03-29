//
//  UIView.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 25.03.2022.
//

import UIKit

extension UIView {
    
    func bottomRoundCorners(corners: UIRectCorner) {
        let radius = CGFloat(5)
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        var masked = CACornerMask()
        if corners.contains(.bottomLeft) { masked.insert(.layerMinXMaxYCorner) }
        if corners.contains(.bottomRight) { masked.insert(.layerMaxXMaxYCorner) }
        self.layer.maskedCorners = masked
    }
    
    func circlesMask() {
        let path = UIBezierPath()
        path.move(to: bounds.origin)
        
        let center = CGPoint(x: bounds.midX, y: bounds.minY)
        let left = CGPoint(x: 0, y: 0)
        let right = CGPoint(x: bounds.midX*2, y: bounds.minY*2)

        path.addArc(withCenter: center, radius: UIWindow().frame.width/15, startAngle: .pi, endAngle: 0, clockwise: false)
        path.addArc(withCenter: left, radius: UIWindow().frame.width/20, startAngle: .pi, endAngle: 0, clockwise: false)
        path.addArc(withCenter: right, radius: UIWindow().frame.width/20, startAngle: .pi, endAngle: 0, clockwise: false)

        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.minY))
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
        path.addLine(to: CGPoint(x: bounds.minX, y: bounds.maxY))
        path.close()

        let centerLayer = CAShapeLayer()
        centerLayer.path = path.cgPath

        self.layer.mask = centerLayer
    }
    
    func makeDashedBorderLine(textViewHeight: CGFloat, selfHeight: CGFloat) {
        let path = CGMutablePath()
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = 2
        shapeLayer.strokeColor = UIColor(ColorConstants.textColor).cgColor
        shapeLayer.lineDashPattern = [2, 3]
        
        path.addLines(between: [CGPoint(x: bounds.minX, y: selfHeight - textViewHeight-30),
                                CGPoint(x: bounds.maxX, y: selfHeight - textViewHeight-30)])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
}
