//
//  ScheduleController.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 04.06.2024.
//

import Foundation
import Combine

final class ScheduleController: ObservableObject {
    @Published var schedule: Schedule = ScheduleMaker().configureSchedule()
    var defaultGreeting = "Доброе утро!"
    
    func getGreeting() -> String {
        schedule.greeting.description
    }
    
    func setGreeting(_ greeting: String) {
        schedule.greeting.description = greeting
    }
    
    func resetGreetingToDefault() {
        schedule.greeting.description = defaultGreeting
    }
}
