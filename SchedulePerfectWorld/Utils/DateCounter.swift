//
//  DateCounter.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 17.05.2024.
//

import Foundation

class DateCounter {
    
    func daysPassedFromDefaultDay() -> Int {
        let date = Date() + 3 * 60 * 60
        return date.days(from: getDefaultDateMSK()!)
    }
    
    func getCurrentDateMSK() -> Date {
        return Date() + 3 * 60 * 60
    }
    
    func getDefaultDateMSK() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let dateTime = formatter.date(from: "2024/05/01 05:00")
        return dateTime
    }
    
    func getCurrentWeekday() -> Int {
        Date().weekday()
    }
}

extension Date {
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    
    func weekday() -> Int {
        let timeZone = TimeZone(abbreviation: "MSK")
        let component =  Calendar.current.dateComponents(in: timeZone!, from: self)
        return component.weekday!
    }
}
