
import Foundation

extension String {
    public func asCurrency(with currencySymbol : String = "$", maxFractionDigit : Int = 2) -> String {
        
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
    
    public var doubleValue : Double? {
        return Double(self)
    }
    
    public var intValue : Int? {
        return Int(self)
    }
    
    public var floatValue : Float? {
        return Float(self)
    }
}
