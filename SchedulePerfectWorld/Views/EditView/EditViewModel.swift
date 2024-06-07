//
//  EditViewViewModel.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 03.06.2024.
//

import Foundation

class EditViewModel: ObservableObject {
//    
//    var scheduleController: ScheduleController
//    var colorSchemeController: ColorSchemeController
//    
    var greetingEditViewModel: GreetingViewModel
    var preventiveWorkViewModel: PreventiveWorkViewModel
    var colorSchemeViewModel: ColorSchemeViewModel
    
    init(scheduleController: ScheduleController, colorSchemeController: ColorSchemeController) {
//        self.scheduleController = scheduleController
//        self.colorSchemeController = colorSchemeController
        greetingEditViewModel = GreetingViewModel(scheduleController: scheduleController)
        preventiveWorkViewModel = PreventiveWorkViewModel(scheduleController: scheduleController)
        colorSchemeViewModel = ColorSchemeViewModel(colorSchemeController: colorSchemeController)
    }
}
