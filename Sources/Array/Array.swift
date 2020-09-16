//
//  Array.swift
//  Pods-SwiftExtensions_Example
//
//  Created by Ankur on 16/9/20.
//

import Foundation

public extension Array where Element : Hashable {
    
    var uniqueValues: [Element] {
        var allowed = Set(self)
        return compactMap { allowed.remove($0) }
    }
    
}

public extension Array where Element : Comparable {
    var isAscendingSorted : Bool {
        guard self.count > 1 else {
            return true
        }
        var sorted = self
        sorted = sorted.sorted()
        return self == sorted
    }
    
    var isDecendingSorted : Bool {
        guard self.count > 1 else {
            return true
        }
        var sorted = self
        sorted = sorted.sorted(by: { (c1, c2) -> Bool in
            if c1 >= c2 {
                return true
            } else {
                return false
            }
        })
        return self == sorted
    }
}



public extension Array where Element : Numeric {
    var sum : Element {
        return self.reduce(0, +)
    }
    
    var multiply : Element {
        return self.reduce(0, *)
    }
}
