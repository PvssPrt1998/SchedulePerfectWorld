//
//  PreferableEventsListViewModel.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 11.06.2024.
//

import Foundation

class PreferableEventsListViewModel: ObservableObject {
    
    var scheduleController: ScheduleController
    @Published var preferableEventsArray: [ScheduleItem] = []
    
    init(scheduleController: ScheduleController) {
        self.scheduleController = scheduleController
        updateArray()
    }
    
    func updateArray() {
        preferableEventsArray = scheduleController.schedule.preferableEvents ?? []
    }
    
    func removeButtonAction(text: String) {
        scheduleController.removePreferableEvent(text: text)
        updateArray()
    }
    
    func isPreferableEventsNilOrEmpty() -> Bool {
        scheduleController.isPreferableEventsNilOrEmpty()
    }
}
