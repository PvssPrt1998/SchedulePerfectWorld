//
//  ScheduleViewViewModel.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 03.06.2024.
//

import Foundation
import Combine

class ScheduleViewModel: ObservableObject {
    
    var scheduleController: ScheduleController
    
    @Published var scheduleItemArray: Array<ScheduleItem> = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init(scheduleController: ScheduleController) {
        self.scheduleController = scheduleController
        makeScheduleItemArray(schedule: scheduleController.schedule)
        scheduleController.$schedule
            .sink { [weak self] schedule in
            self?.makeScheduleItemArray(schedule: schedule)
        }
        .store(in: &cancellables)
    }
    
    func makeScheduleItemArray(schedule: Schedule) {
        scheduleItemArray = []
        scheduleItemArray.append(schedule.greeting)
        if schedule.preventiveWork != nil {
            scheduleItemArray.append(schedule.preventiveWork!)
        }
        if schedule.preferableEvents != nil {
            scheduleItemArray.append(contentsOf: schedule.preferableEvents!)
        }
        if schedule.everyweekEvents != nil {
            scheduleItemArray.append(contentsOf: schedule.everyweekEvents!)
        }
        scheduleItemArray.append(contentsOf: schedule.everydayEvents)
    }
}
