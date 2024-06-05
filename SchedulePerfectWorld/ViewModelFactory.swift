//
//  ViewModelFactory.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 03.06.2024.
//

import Foundation

class ViewModelFactory {
    
    let scheduleController = ScheduleController()
    
    func makeScheduleViewModel() -> ScheduleViewModel {
        ScheduleViewModel(scheduleController: scheduleController)
    }
    
    func makeEditViewModel() -> EditViewModel {
        EditViewModel(scheduleController: scheduleController)
    }
}
