import Foundation

public extension Calendar {
    
}

extension Calendar {
    enum Month : Int, CustomStringConvertible {
        case january = 1, february, march, april, may, june, july, august, september, october, november, december
        var description: String {
            switch self.rawValue {
                case 1:
                    return "January"
                case 2:
                    return "February"
                case 3:
                    return "March"
                case 4:
                    return "April"
                case 5:
                    return "May"
                case 6:
                    return "June"
                case 7:
                    return "July"
                case 8:
                    return "August"
                case 9:
                    return "September"
                case 10:
                    return "October"
                case 11:
                    return "November"
                case 12:
                    return "December"
                default:
                    fatalError("Month value is in range of 1 to 12")
            }
        }
    }
}
