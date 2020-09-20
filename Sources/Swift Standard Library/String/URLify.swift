//
//  URLify.swift
//  SwiftExtensions
//
//  Created by Ankur on 16/9/20.
//

import Foundation

public extension String {
    
    var url : URL? {
        return URL(string: self)
    }
    
    var isFileURL : Bool {
        return self.url?.isFileURL ?? false
    }
    
    var isHTTPSURL : Bool {
        guard let url = self.url, let scheme = url.scheme else {
            return false
        }
        return scheme == "https"
    }
    
}
