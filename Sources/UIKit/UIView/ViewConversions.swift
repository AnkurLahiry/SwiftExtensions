//
//  ViewConversions.swift
//  SwiftExtensions
//
//  Created by Ankur on 20/9/20.
//

import Foundation
import UIKit

public extension UIView {
    var toImage : UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

public extension UIView {
    var isDarkModeEnabled : Bool {
        if #available(iOS 12.0, *) {
            if self.traitCollection.userInterfaceStyle == .dark {
                return true
            }
        }
        return false
    }
}
