//
//  PreferableEventViewModel.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 07.06.2024.
//

import SwiftUI
import Combine

final class PreferableEventViewModel {
    
    var preferableEventAddViewModel: PreferableEventAddViewModel
    var preferableEventsListViewModel: PreferableEventsListViewModel
    
    private var cancellables = Set<AnyCancellable>()
    
    init(scheduleController: ScheduleController) {
        preferableEventAddViewModel = PreferableEventAddViewModel(scheduleController: scheduleController)
        preferableEventsListViewModel = PreferableEventsListViewModel(scheduleController: scheduleController)
        preferableEventAddViewModel.objectWillChange.sink { [weak self] _ in
            self?.preferableEventsListViewModel.updateArray()
        }
        .store(in: &cancellables)
    }
}
