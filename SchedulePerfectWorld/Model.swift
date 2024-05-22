//
//  Model.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 17.05.2024.
//

import Foundation

struct ScheduleItem: Hashable {
    var imageTitle: String?
    var description: String
}

struct Schedule {
    var greeting: ScheduleItem
    var preventiveWork: ScheduleItem?
    var preferableEvents: [ScheduleItem]?
    var everyweekEvents: [ScheduleItem]?
    var everydayEvents: [ScheduleItem]
}
