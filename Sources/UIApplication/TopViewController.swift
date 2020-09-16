//
//  TopViewController.swift
//  SwiftExtensions
//
//  Created by Ankur on 16/9/20.
//

import Foundation
import UIKit

public extension UIApplication {
    /// Returns which view controller is currently top on the screen
    /// - Parameter base: Base View Controller , default is RootViewController
    /// - Returns: UIViewController
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}
