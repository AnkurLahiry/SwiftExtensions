//
//  EmojiExtensions.swift
//  Pods-SwiftExtensions_Example
//
//  Created by Ankur on 16/9/20.
//

import Foundation

extension String {
    public var isSingleEmoji: Bool { count == 1 && containsEmoji }
    
    public var containsEmoji: Bool { contains { $0.isEmoji } }
    
    public var containsOnlyEmoji: Bool { !isEmpty && !contains { !$0.isEmoji } }
    
    public var emojiString: String { emojis.map { String($0) }.reduce("", +) }
    
    public var emojis: [Character] { filter { $0.isEmoji } }
    
    public var emojiScalars: [UnicodeScalar] { filter { $0.isEmoji }.flatMap { $0.unicodeScalars } }
}
