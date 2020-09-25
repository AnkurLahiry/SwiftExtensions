//
//  UIViewControllerExtension.swift
//  SwiftExtensions
//
//  Created by Ankur on 20/9/20.
//

import Foundation
import UIKit

extension UIViewController {
    
    var isDarkModeEnabled : Bool {
        return self.view.isDarkModeEnabled
    }
    
    var isVisible : Bool {
        return isViewLoaded && view.window != nil
    }
}
