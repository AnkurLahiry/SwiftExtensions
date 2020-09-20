//
//  DateExtensions.swift
//  SwiftExtensions
//
//  Created by Ankur on 20/9/20.
//

import Foundation

public extension Date {
    
    ///Extract Day of the date. Example returns 28 if the day is 28/12/1992
    var day : Int? {
        let components = Calendar.current.dateComponents([.day], from: self)
        return components.day
    }
    
    ///Extract Month of the date. Example returns 12 if the day is 28/12/1992
    var month : Int? {
        let components = Calendar.current.dateComponents([.month], from: self)
        return components.month
    }
    
    ///Extract Year of the date. Example returns 1992 if the day is 28/12/1992
    var year : Int? {
        let components = Calendar.current.dateComponents([.year], from: self)
        return components.year
    }
    
    var hour : Int? {
        let components = Calendar.current.dateComponents([.hour], from: self)
        return components.hour
    }
    
    var minute : Int? {
        let components = Calendar.current.dateComponents([.minute], from: self)
        return components.minute
    }
    
    var second : Int? {
        let components = Calendar.current.dateComponents([.second], from: self)
        return components.second
    }
    
    var nanosecond : Int? {
        let components = Calendar.current.dateComponents([.nanosecond], from: self)
        return components.nanosecond
    }
    
    var quarter : Int? {
        let components = Calendar.current.dateComponents([.quarter], from: self)
        return components.quarter
    }
    
    ///Get the month name "January/February/..."
    var monthName : String? {
        let components = Calendar.current.dateComponents([.month], from: self)
        guard let month = components.month, let name = Calendar.Month(rawValue: month) else {
            return nil
        }
        return name.description
    }
    
    ///Get the next date from the given date
    var nextDate : Date? {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)
    }
    
    ///Get the previous date from the given date
    var previousDate : Date? {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)
    }
    
    ///Get the difference between current time and utc time in miliseconds. East countries of UTC are ahead of UTC so - and rest are +
    var utcOffsetMilisecs : Int {
        return Int(-TimeInterval(TimeZone.current.secondsFromGMT())) * 1000
    }
    
    ///Get the difference between current time and GMT in miliseconds. East countries of UTC are ahead of UTC so - and rest are +
    var timeZoneOffsetMilisecs : Int {
        return Int(-1 * TimeZone.current.secondsFromGMT() * 1000)
    }
    
    
    /// Convert a date to string with the given format
    /// - Parameter format: format of the date , default is "dd/MM/yyyy h:mm a"
    /// - Returns: Date format String 
    func toString(format : String = "dd/MM/yyyy h:mm a") -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func difference(with date : Date) -> TimeInterval {
        let delta = self - date
        return delta
    }
    
    
}

extension Date {
    static func - (lhs : Date, rhs : Date) -> TimeInterval {
        // thanks to **Mischa** https://stackoverflow.com/a/50958263/8475638
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceNow
    }
}
