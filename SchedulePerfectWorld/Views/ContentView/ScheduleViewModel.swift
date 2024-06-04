//
//  ScheduleViewViewModel.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 03.06.2024.
//

import Foundation

class ScheduleViewModel {
    
    @Published var schedule: Schedule

    init() {
        schedule = ScheduleMaker().configureSchedule()
    }
}
