//
//  Localizations.swift
//  SwiftExtensions
//
//  Created by Ankur on 16/9/20.
//

import Foundation

public extension String {
    var localized : String {
        return NSLocalizedString(self, comment: "")
    }
}
