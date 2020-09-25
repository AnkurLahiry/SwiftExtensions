
import Foundation

public extension String {
    func asCurrency(with currencySymbol : String = "$", maxFractionDigit : Int = 2) -> String {
        
        guard let value = self.doubleValue else {
            fatalError("Unable to convert string to double")
        }
        let stringAsNumber = NSNumber(value: value)
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = maxFractionDigit
        formatter.secondaryGroupingSize = maxFractionDigit
        if let formattedCurrency = formatter.string(from: stringAsNumber) {
            return "\(currencySymbol)" + formattedCurrency
        }
        fatalError("Unable to format")
    }
    
    var doubleValue : Double? {
        return Double(self)
    }
    
    var intValue : Int? {
        return Int(self)
    }
    
    var floatValue : Float? {
        return Float(self)
    }
    
    
    /// Convert A String to K Value
    /// Example -> 36000.toK = 36K
    var toK : String? {
        guard let `int` = self.doubleValue, `int` > 0 else {
            fatalError("Unable to convert String to Int")
        }
        return "\(`int` / 1000)K"
    }
    
    var toM : String? {
        guard let `int` = self.intValue else {
            fatalError("Unable to convert String to Int")
        }
        return "\(`int` / 1000 / 1000)M"
    }
    
    var toB : String? {
        guard let `int` = self.intValue else {
            fatalError("Unable to convert String to Int")
        }
        return "\(`int` / 1000 / 1000 / 1000)B"
    }
    
}
