//
//  UISwitchExtensions.swift
//  SwiftExtensions
//
//  Created by Ankur on 20/9/20.
//

import Foundation
import UIKit

public extension UISwitch {
    
    ///  UISwitch has an intrinsic size of 51 x 31. So we have to transform if we are in need of different size
    /// - Parameters:
    ///   - dx: transformation amount of scale x
    ///   - dy: transformation amount of scale y
    func resize(dx : CGFloat, dy : CGFloat) {
        self.transform = CGAffineTransform(scaleX: dx, y: dy)
    }
    
    
}
