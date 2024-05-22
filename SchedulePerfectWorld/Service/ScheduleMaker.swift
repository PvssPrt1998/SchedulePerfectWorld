//
//  ScheduleMaker.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 19.05.2024.
//

import Foundation

class ScheduleMaker {
    
    private var weekday: Weekday = .getBy(DateCounter().getCurrentWeekday())
    private var events = Events()
    
    func configureSchedule() -> Schedule {
        Schedule(greeting: ScheduleItem(description: "Доброе утро!"),
                 everyweekEvents: configureEveryweekEvents(),
                 everydayEvents: configureEverydayEvents()
        )
    }
    
    private func configureEverydayEvents() -> [ScheduleItem] {
        var scheduleItems: Array<ScheduleItem> = []
        if weekday == .saturday || weekday == .sunday {
            scheduleItems.append(events.clanHallTask.clanHallDescription(type: .floatType))
        } else {
            scheduleItems.append(events.clanHallTask.clanHallDescription(type: .defaultType))
        }
        
        if weekday != .tuesday {
            scheduleItems.append(events.supplyWagon)
        }
        
        scheduleItems.append(events.everydayDungeon)
        
        return scheduleItems
    }
    
    private func configureEveryweekEvents() -> [ScheduleItem]? {
        switch weekday {
            case .monday: configureMondaySchedule()
            case .tuesday: configureTuesdaySchedule()
            case .wednesday: configureWednesdaySchedule()
            case .thursday: configureThursdaySchedule()
            case .friday: configureFridaySchedule()
            default: nil
        }
    }
    
    private func configureMondaySchedule() -> [ScheduleItem] {
        [events.dynastyBattle]
    }
    
    private func configureTuesdaySchedule() -> [ScheduleItem] {
        [events.godsFuck]
    }
    
    private func configureWednesdaySchedule() -> [ScheduleItem] {
        [events.clanHallParty, events.battleForResources]
    }
    
    private func configureThursdaySchedule() -> [ScheduleItem] {
        [events.arenaCheck]
    }
    
    private func configureFridaySchedule() -> [ScheduleItem] {
        [events.dynastyBattle]
    }
}
