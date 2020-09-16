//
//  UserDefaultsExtensions.swift
//  SwiftExtensions
//
//  Created by Ankur on 16/9/20.
//

import Foundation

extension UserDefaults {
    static func store(key : String, value : Any) {
        self.standard.set(value, forKey: key)
        self.standard.synchronize()
    }
    
    static func delete(key : String) {
        self.standard.removeObject(forKey: key)
    }
    
    static func get(key : String) -> Any? {
        return self.standard.object(forKey: key)
    }
}
