//
//  UIView+Shadow.swift
//  SwiftEntryKit
//
//  Created by Daniel Huri on 4/25/18.
//

import UIKit

extension UIView {
    func applyDropShadow(withOffset offset: CGSize,
                         opacity: Float,
                         radius: CGFloat,
                         color: UIColor) {
        layer.applyDropShadow(withOffset: offset,
                              opacity: opacity,
                              radius: radius,
                              color: color)
    }
    
    func removeDropShadow() {
        layer.removeDropShadow()
    }
}

extension CALayer {
    func applyDropShadow(withOffset offset: CGSize,
                         opacity: Float,
                         radius: CGFloat,
                         color: UIColor) {
        shadowOffset = offset
        shadowOpacity = opacity
        shadowRadius = radius
        shadowColor = color.cgColor
        shouldRasterize = true
        rasterizationScale = UIScreen.main.scale
    }
    
    func removeDropShadow() {
        shadowOffset = .zero
        shadowOpacity = 0
        shadowRadius = 0
        shadowColor = UIColor.clear.cgColor
        shouldRasterize = false
    }
}

import UIKit

enum DropShadowType {
    case rect, circle, dynamic
}

extension UIView {
    func addDropShadow(type: DropShadowType = .dynamic, color: UIColor = UIColor.black, opacity: Float = 0.3, radius: CGFloat = 4.0, shadowOffset: CGSize = CGSize.zero) {
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowOffset = shadowOffset
        layer.shadowColor = color.cgColor

        switch type {
        case .circle:
            let halfWidth = frame.size.width * 0.5
            layer.shadowPath = UIBezierPath(arcCenter: CGPoint(x: halfWidth, y: halfWidth), radius: halfWidth, startAngle: 0.0, endAngle: CGFloat.pi * 2, clockwise: true).cgPath
            layer.shouldRasterize = true
            layer.rasterizationScale = UIScreen.main.scale
        case .rect:
            layer.shadowPath = UIBezierPath(roundedRect: frame, cornerRadius: layer.cornerRadius).cgPath
            layer.shouldRasterize = true
        case .dynamic:
            layer.shouldRasterize = true
            layer.rasterizationScale = UIScreen.main.scale
        }
    }
}
