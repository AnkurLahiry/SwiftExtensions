//
//  EmojiExtensions.swift
//  Pods-SwiftExtensions_Example
//
//  Created by Ankur on 16/9/20.
//

import Foundation

public extension String {
    
    ///check if the String contains single Emoji
    var isSingleEmoji: Bool { count == 1 && containsEmoji }
    
    ///check if the String contains emoji
    var containsEmoji: Bool { contains { $0.isEmoji } }
    
    ///check if the String just contains emoji
    var containsOnlyEmoji: Bool { !isEmpty && !contains { !$0.isEmoji } }
    
    ///Returns emojis as a string from a string
    var emojiString: String { emojis.map { String($0) }.reduce("", +) }
    
    ///Extract emojis from a string
    var emojis: [Character] { filter { $0.isEmoji } }
    
    var emojiScalars: [UnicodeScalar] { filter { $0.isEmoji }.flatMap { $0.unicodeScalars } }
}
