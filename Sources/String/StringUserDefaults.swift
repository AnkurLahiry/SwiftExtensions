//
//  StringUserDefaults.swift
//  SwiftExtensions
//
//  Created by Ankur on 16/9/20.
//

import Foundation

public extension String {
    init?(key: String) {
        guard let str = UserDefaults.get(key: key) as? String else { return nil }
        self.init(str)
    }
    
    func store(key: String) {
        UserDefaults.store(key: key, value: self)
    }
}
