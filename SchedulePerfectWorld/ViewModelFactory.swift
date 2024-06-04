//
//  ViewModelFactory.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 03.06.2024.
//

import Foundation

class ViewModelFactory {
    
    func makeScheduleViewModel() -> ScheduleViewModel {
        ScheduleViewModel()
    }
    
    func makeEditViewModel() -> EditViewModel {
        EditViewModel()
    }
}
