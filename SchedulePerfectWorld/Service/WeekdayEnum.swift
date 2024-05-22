//
//  WeekdayEnum.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 19.05.2024.
//

import Foundation

enum Weekday: Int, CaseIterable {
    case sunday = 1
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    
    static func getBy(_ number: Int) -> Self {
        self.allCases.first(where: {$0.rawValue == number}) ?? .tuesday
    }
}
