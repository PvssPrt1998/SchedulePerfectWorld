//
//  ScheduleController.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 04.06.2024.
//

import Foundation
import Combine

final class ScheduleController: ObservableObject {
    @Published var schedule: Schedule
    var defaultGreeting = "Доброе утро!"
    
    init() {
        schedule = ScheduleMaker().configureSchedule()
    }
    
    func getGreeting() -> String {
        schedule.greeting.description
    }
    
    func setGreeting(_ greeting: String) {
        schedule.greeting.description = greeting
    }
    
    func isDefaultGreeting() -> Bool {
        schedule.greeting.description == defaultGreeting
    }
    
    func resetGreetingToDefault() {
        schedule.greeting.description = defaultGreeting
    }
    
    func isPreventiveWorkNil() -> Bool {
        schedule.preventiveWork == nil
    }
    
    func removePreventiveWork() {
        schedule.preventiveWork = nil
    }
    
    func setPreventiveWork(text: String) {
        schedule.preventiveWork = ScheduleItem(description: text)
    }
}
