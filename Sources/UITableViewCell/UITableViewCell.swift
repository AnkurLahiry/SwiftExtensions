//
//  UITableViewCell.swift
//  SwiftExtensions
//
//  Created by Ankur on 16/9/20.
//

import Foundation
import UIKit

public extension UITableViewCell {
    func enable(on : Bool, disabledAlpha : CGFloat = 0.5) {
        self.isUserInteractionEnabled = on
        for case let view in self.subviews {
            view.alpha = on ? 1 : disabledAlpha
        }
    }
}
