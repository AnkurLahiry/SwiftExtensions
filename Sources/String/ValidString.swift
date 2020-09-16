import Foundation

public extension String {
    
    /// Check if the string is a valid URL
    var isValidURL: Bool {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
            return match.range.length == self.utf16.count
        } else {
            return false
        }
    }
    
    /// Check if the string is a valid email
    var isValidEmail : Bool {
        return matchWith(regex: emailRegularExpression)
    }
    
    /// check if the String is alphaNumeric
    var isAlphaNumeric : Bool {
        let string = self
        let alphaNumericSet = CharacterSet.alphanumerics
        let numberSet = CharacterSet.decimalDigits
        return (string.trimmingCharacters(in: alphaNumericSet) == "" &&
            !(string.trimmingCharacters(in: numberSet) == ""))
    }
    
    /// check if the string contains digit
    var containsDigit : Bool {
        let string = self
        let decimalCharacters = CharacterSet.decimalDigits
        let decimalRange = string.rangeOfCharacter(from: decimalCharacters)
        if decimalRange != nil {
            return true
        }
        return false
    }
    
    /// check if the string letter
    var containsLetter : Bool {
        let string = self
        let lettersChars = CharacterSet.letters
        let lettersRange = string.rangeOfCharacter(from: lettersChars)
        if lettersRange != nil {
            return true
        }
        return false
    }
    
    var isOnlyWhiteSpaced : Bool {
        let string = self.trimWitWhiteSpacesAndhNewLine
        return string.isEmpty
    }
    
    
    /// Check if the string is a valid OTP. OTP should contains only digits.
    /// - Parameter length: The maximum length of the OTP Should be
    /// - Returns: Boolean Value
    func isValidOTP(length : Int) -> Bool {
        if self.count < length {
            return false
        }
        let regualrExpressionOTP = "^[0-9]{\(length)}$"
        return matchWith(regex: regualrExpressionOTP)
    }
    
    /// Checks if it the String is a Strong Password
    /// A Strong Password Contains of at least
    /// A **Special** Character
    /// A **Upper Cased** Character
    /// A **Lower Cased** Character
    /// A **Numeric Digit**
    /// Minimum a **length**, the length is user defined
    /// - Parameter length: Minimum length of the Password Should be
    /// - Returns: is the password is strong
    func isStrongPassword(min length : Int) -> Bool {
        guard self.count >= length else {
            return false
        }
        let regularExpression = "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z]).{\(length),}$"
        return matchWith(regex: regularExpression)
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
