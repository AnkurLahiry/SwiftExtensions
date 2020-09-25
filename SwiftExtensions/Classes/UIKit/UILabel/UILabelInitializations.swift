//
//  UILabelInitializations.swift
//  SwiftExtensions
//
//  Created by Ankur on 25/9/20.
//

import Foundation
import UIKit

public extension UILabel {
    convenience init(text : String) {
        self.init()
        self.text = text
    }
    
    convenience init(text : String,
                     textColor : UIColor = .black,
                     alignment : NSTextAlignment = .left,
                     font : UIFont = UIFont.systemFont(ofSize: 17)) {
        self.init(text: text)
        self.textColor = textColor
        self.textAlignment = alignment
        self.font = font
    }
    
    /// Get the visible length of a String in label
    var visibleTextLength: Int {
        
        guard let text = text, text.count > 0 else {
            return 0
        }
        
        let font = self.font ?? UIFont.systemFont(ofSize: 17)
        let mode = self.lineBreakMode
        let labelWidth: CGFloat = self.frame.size.width
        let labelHeight: CGFloat = self.frame.size.height
        let sizeConstraint = CGSize(width: labelWidth, height: CGFloat.greatestFiniteMagnitude)
        
        let attributes = [NSAttributedString.Key.font: font]
        let attributedText = NSAttributedString(string: text, attributes: attributes)
        let boundingRect: CGRect = attributedText.boundingRect(with: sizeConstraint, options: .usesLineFragmentOrigin, context: nil)

        if boundingRect.size.height > labelHeight {
            var index: Int = 0
            var prev: Int = 0
            let characterSet = CharacterSet.whitespacesAndNewlines
            repeat {
                prev = index
                if mode == NSLineBreakMode.byCharWrapping {
                    index += 1
                } else {
                    index = (text as NSString).rangeOfCharacter(from: characterSet, options: [], range: NSRange(location: index + 1, length: text.count - index - 1)).location
                }
            } while index != NSNotFound && index < text.count && (text as NSString).substring(to: index).boundingRect(with: sizeConstraint, options: .usesLineFragmentOrigin, attributes: attributes, context: nil).size.height <= labelHeight
            return prev
        }
        
        return text.count
    }
}
