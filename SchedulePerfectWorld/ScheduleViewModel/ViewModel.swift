//
//  ViewModel.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 17.05.2024.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var colorSchemeStateManager = ColorSchemeStateManager()
    @Published var greetingViewStateManager = GreetingViewStateManager()
    @Published var preventiveWorkStateManager = PreventiveWorkViewStateManager()
    @Published var preferableEventsStateManager = PreferableEventsViewStateManager()
    
    @Published var schedule: Schedule
    
    init() {
        schedule = ScheduleMaker().configureSchedule()
    }
}
