//
//  ShadowView.swift
//  SwiftExtensions
//
//  Created by Ankur on 20/9/20.
//

import Foundation

public extension UIView {
    func applyDropShadow(shadowColor: UIColor, shadowOffsetWidth: Int, shadowOffsetHeight: Int, shadowOppacity: Float, shadowCornerRadius: CGFloat) {
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: shadowCornerRadius).cgPath
        self.layer.shadowOpacity = shadowOppacity
    }
    
    func removeShadow() {
        layer.shadowOffset = .zero
        layer.shadowColor = UIColor.clear.cgColor
        layer.cornerRadius = 0.0
        layer.shadowRadius = 0.0
        layer.shadowOpacity = 0.0
    }
}
