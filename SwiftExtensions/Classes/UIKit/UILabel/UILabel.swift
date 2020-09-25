//
//  UILabel.swift
//  SwiftExtensions
//
//  Created by Ankur on 16/9/20.
//

import Foundation
import UIKit

public extension UILabel {
    
    /// Strike Through a label.
    /// - Parameters:
    ///   - lineWidth: Width of the line
    ///   - lineColor: UIColor of the line
    func strikeThrough(lineWidth : Int , lineColor : UIColor) {
        guard let text = self.text, !text.isEmpty else {
            return
        }
        
        guard let mutableAttr = self.mutableAttributedString else {
            return
        }
        
        mutableAttr.addAttribute(NSAttributedString.Key.strikethroughStyle, value: lineWidth, range: NSMakeRange(0, mutableAttr.length))
        mutableAttr.addAttribute(
            NSAttributedString.Key.strikethroughColor, value: lineColor, range: NSMakeRange(0, mutableAttr.length))
        
        self.attributedText = mutableAttr
    }
    
    /// Add a Underline of a label
    /// - Parameters:
    ///   - lineWidth: Width of the line
    ///   - lineColor: UIColor of the line
    func underline(lineWidth : Int = 1, lineColor : UIColor) {
        guard let text = self.text, !text.isEmpty else {
            return
        }
        
        guard let mutableAttr = self.mutableAttributedString else {
            return
        }
        
        mutableAttr.addAttribute(NSAttributedString.Key.underlineStyle, value: lineWidth, range: NSMakeRange(0, mutableAttr.length))
        mutableAttr.addAttribute(
            NSAttributedString.Key.underlineColor, value: lineColor, range: NSMakeRange(0, mutableAttr.length))
        
        self.attributedText = mutableAttr
    }
    
    
    
    /// Add Subscript in the text of a label
    /// - Parameter indicesOfSubscripts: Array of the positions where subscript is needed
    func addSubscripts(indicesOfSubscripts: [Int]) {
        guard let font = self.font else {
            return
        }
        
        guard let mutableAttr = self.mutableAttributedString else {
            return
        }
        
        let subscriptFont = font.withSize(font.pointSize * 0.7)
        let subscriptOffset = -font.pointSize * 0.3
        
        for index in indicesOfSubscripts {
            let range = NSRange(location: index, length: 1)
            mutableAttr.setAttributes([.font: subscriptFont,
                                            .baselineOffset: subscriptOffset],
                                           range: range)
        }
        self.attributedText = mutableAttr
    }
    
    /// Add Super script to the text of a label
    /// - Parameter indicesOfSubscripts: Array of the positions where subscript is needed
    func addSuperScript(indicesOfSubscripts: [Int]) {
        guard let font = self.font else {
            return
        }
        
        guard let mutableAttr = self.mutableAttributedString else {
            return
        }
        
        let subscriptFont = font.withSize(font.pointSize * 0.7)
        let subscriptOffset = font.pointSize * 0.3
        
        for index in indicesOfSubscripts {
            let range = NSRange(location: index, length: 1)
            mutableAttr.setAttributes([.font: subscriptFont,
                                       .baselineOffset: subscriptOffset],
                                      range: range)
        }
        self.attributedText = mutableAttr
    }
}

public extension UILabel {
    var mutableAttributedString : NSMutableAttributedString? {
        guard let text = text else {
            return nil
        }
        var mutableAttr : NSMutableAttributedString
        
        if let attr = self.attributedText {
            mutableAttr = NSMutableAttributedString(attributedString: attr)
        } else {
            mutableAttr = NSMutableAttributedString(string: text)
        }
        return mutableAttr
    }
}

public extension UILabel {
    func addImageWith(name: String, behindText: Bool) {
        // if image is behind the text set behindText = true , else : false
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: name)
        
        let attachmentString = NSAttributedString(attachment: attachment)
        
        guard let text = self.text else {
            return
        }
        
        if (text.isEmpty) {
            return
        }
        
        if behindText {
            let labelText = NSMutableAttributedString(string: text + " ")
            labelText.append(attachmentString)
            self.attributedText = labelText
        } else {
            let labelText = NSAttributedString(string: " " + text)
            let mutableAttachmentString = NSMutableAttributedString(attributedString: attachmentString)
            mutableAttachmentString.append(labelText)
            self.attributedText = mutableAttachmentString
        }
    }
    
    func removeImage() {
        let text = self.text
        self.attributedText = nil
        self.text = text
    }
}
