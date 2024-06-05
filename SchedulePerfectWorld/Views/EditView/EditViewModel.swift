//
//  EditViewViewModel.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 03.06.2024.
//

import Foundation

class EditViewModel: ObservableObject {
    
    var scheduleController: ScheduleController
    
    var greetingEditViewModel: GreetingViewModel
    
    init(scheduleController: ScheduleController) {
        self.scheduleController = scheduleController
        greetingEditViewModel = GreetingViewModel(scheduleController: scheduleController)
        
    }
}
