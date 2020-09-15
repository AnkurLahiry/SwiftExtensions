import Foundation

extension String {
    
    /// Check if the string is a valid URL
    public var isValidURL: Bool {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
            return match.range.length == self.utf16.count
        } else {
            return false
        }
    }
    
    /// Check if the string is a valid email
    public var isValidEmail : Bool {
        return matchWith(regex: emailRegularExpression)
    }
    
    /// check if the String is alphaNumeric
    public var isAlphaNumeric : Bool {
        let string = self
        let alphaNumericSet = CharacterSet.alphanumerics
        let numberSet = CharacterSet.decimalDigits
        return (string.trimmingCharacters(in: alphaNumericSet) == "" &&
            !(string.trimmingCharacters(in: numberSet) == ""))
    }
    
    /// check if the string contains digit
    public var containsDigit : Bool {
        let string = self
        let decimalCharacters = CharacterSet.decimalDigits
        let decimalRange = string.rangeOfCharacter(from: decimalCharacters)
        if decimalRange != nil {
            return true
        }
        return false
    }
    
    /// check if the string letter
    public var containsLetter : Bool {
        let string = self
        let lettersChars = CharacterSet.letters
        let lettersRange = string.rangeOfCharacter(from: lettersChars)
        if lettersRange != nil {
            return true
        }
        return false
    }
    
    
    /// Check if the string is a valid OTP. OTP should contains only digits.
    /// - Parameter length: The maximum length of the OTP Should be
    /// - Returns: Boolean Value
    public func isValidOTP(length : Int) -> Bool {
        if self.count < length {
            return false
        }
        let regualrExpressionOTP = "^[0-9]{\(length)}$"
        return matchWith(regex: regualrExpressionOTP)
    }
    
    private func matchWith(regex : String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: regex, options: [])
            let numberOfMatchedString = regex.numberOfMatches(in: self, options: [], range: NSRange(location: 0, length: self.count))
            if numberOfMatchedString == 1 {
                return true
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
}
