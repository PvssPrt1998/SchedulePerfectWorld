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
    var localStorage = LocalStorage()
    
    init() {
        schedule = ScheduleMaker().configureSchedule()
        schedule.preferableEvents = try? localStorage.getPreferableEventsArray().map({ScheduleItem(description: $0)})
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
    
    func isPreferableEventsNil() -> Bool {
        schedule.preferableEvents == nil
    }
    
    func isPreferableEventsNilOrEmpty() -> Bool {
        schedule.preferableEvents == nil || schedule.preferableEvents == []
    }
    
    func isPreferableEventAlreadyExist(text: String) -> Bool {
        if !isPreferableEventsNil() {
            return schedule.preferableEvents!.contains(where: { $0.description == text })
        }
        return false
    }
    
    func addPreferableEvent(text: String) {
        if isPreferableEventsNil() { schedule.preferableEvents = [] }
        schedule.preferableEvents?.append(ScheduleItem(description: text))
        localStorage.addPreferableEvent(desctiption: text)
    }
    
    func removePreferableEvent(text: String) {
        schedule.preferableEvents?.removeAll(where: { $0.description == text })
        try? localStorage.removePreferableEvent(by: text)
    }
}
