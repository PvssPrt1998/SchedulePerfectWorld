//
//  EditViewViewModel.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 03.06.2024.
//

import Foundation

class EditViewModel: ObservableObject {
    
    var greetingEditViewModel: GreetingViewModel
    var preventiveWorkViewModel: PreventiveWorkViewModel
    var preferableEventViewModel: PreferableEventViewModel
    var colorSchemeViewModel: ColorSchemeViewModel
    
    init(scheduleController: ScheduleController, colorSchemeController: ColorSchemeController) {
        greetingEditViewModel = GreetingViewModel(scheduleController: scheduleController)
        preventiveWorkViewModel = PreventiveWorkViewModel(scheduleController: scheduleController)
        preferableEventViewModel = PreferableEventViewModel(scheduleController: scheduleController)
        colorSchemeViewModel = ColorSchemeViewModel(colorSchemeController: colorSchemeController)
    }
}
