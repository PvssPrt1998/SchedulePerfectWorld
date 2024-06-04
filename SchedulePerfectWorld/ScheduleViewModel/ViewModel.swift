//
//  ViewModel.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 17.05.2024.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var colorSchemeStateManager = ColorSchemeStateManager()
    @Published var greetingViewStateManager = GreetingViewStateManager()
    @Published var preventiveWorkStateManager = PreventiveWorkViewStateManager()
    @Published var preferableEventsStateManager = PreferableEventsViewStateManager()
    
    @Published var schedule: Schedule {
        didSet {
            makeScheduleItemArray()
        }
    }
    
    @Published var scheduleItemArray: Array<ScheduleItem> = []
    
    init() {
        schedule = ScheduleMaker().configureSchedule()
        makeScheduleItemArray()
    }
    
    func makeScheduleItemArray() {
        scheduleItemArray = []
        scheduleItemArray.append(schedule.greeting)
        if schedule.preventiveWork != nil {
            scheduleItemArray.append(schedule.preventiveWork!)
        }
        if schedule.preferableEvents != nil {
            scheduleItemArray.append(contentsOf: schedule.preferableEvents!)
        }
        if schedule.everyweekEvents != nil {
            scheduleItemArray.append(contentsOf: schedule.everyweekEvents!)
        }
        scheduleItemArray.append(contentsOf: schedule.everydayEvents)
    }
}
