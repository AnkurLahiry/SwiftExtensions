
import Foundation

public extension String {
    
    ///Removes whitespaces from both side of the string
    var trim : String {
        return self.trimmingCharacters(in: .whitespaces)
    }
    
    ///Removes the white spaces and new lines from the string 
    var trimWitWhiteSpacesAndhNewLine : String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var reverse : String {
        return String(self.reversed())
    }
    
    var isPalindrome : Bool {
        return self == self.reverse
    }
    
    subscript (i: Int) -> String {
        guard i >= 0 && i <= length else {
            fatalError("Index out of bound")
        }
        return self[i ..< i + 1]
    }
    
    func substring(from index: Int) -> String {
        guard index >= 0 && index < length else {
            fatalError("Index out of bound")
        }
        return self[min(index, length) ..< length]
    }
    
    func substring(to index: Int) -> String {
        guard index >= 0 && index <= length else {
            fatalError("Index out of bound")
        }
        return self[0 ..< max(0, index)]
    }
    
    func subString(from fIndex : Int, to tIndex : Int) -> String {
        guard fIndex >= 0 && fIndex <= length else {
            fatalError("Index out of bound")
        }
        
        guard tIndex >= 0 && tIndex <= length else {
            fatalError("Index out of bound")
        }
        
        guard fIndex <= tIndex else {
            fatalError("Exception: From index is greater than the To index, which is illigal")
        }
        
        return self[fIndex ..< tIndex + 1]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

private extension String {
    private var vowels : [String] {
        return ["a", "e", "i", "o", "u"]
    }
    
    private var consonents : [String] {
        return ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"]
    }
    
    private var length: Int {
        return count
    }
}
