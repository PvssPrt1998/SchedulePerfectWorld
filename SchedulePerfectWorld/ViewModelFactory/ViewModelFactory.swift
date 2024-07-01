//
//  ViewModelFactory.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 03.06.2024.
//

import Foundation

final class ViewModelFactory {
    
    let scheduleController = ScheduleController()
    let colorSchemeController = ColorSchemeController()
    
    func makeScheduleViewModel() -> ScheduleViewModel {
        ScheduleViewModel(scheduleController: scheduleController)
    }
    
    func makeEditViewModel() -> EditViewModel {
        EditViewModel(scheduleController: scheduleController, colorSchemeController: colorSchemeController)
    }
}
