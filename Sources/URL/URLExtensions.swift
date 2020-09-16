//
//  URLExtensions.swift
//  SwiftExtensions
//
//  Created by Ankur on 16/9/20.
//

import Foundation

public extension URL {
    
    var isValidURL : Bool {
        return self.absoluteString.isValidURL
    }
    
    
}
