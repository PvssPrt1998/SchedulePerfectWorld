//
//  PreferableEventViewModel.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 07.06.2024.
//

import SwiftUI
import Combine

final class PreferableEventViewModel: ObservableObject, PreferableEventContext {
    
    @Published var scheduleController: ScheduleController
    
    @Published var text = "" {
        didSet {
            textChanged(oldValue: oldValue, currentValue: text)
        }
    }
    @Published var state: PreferableEventViewState
    var isAddButtonDisabled: Bool = true {
        didSet {
            isAddButtonDisabled ? (tintColor = .gray) : (tintColor = .buttonIsActive)
        }
    }
    var tintColor: Color = .gray
    var preferableEventsArray: [ScheduleItem] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init(scheduleController: ScheduleController) {
        self.scheduleController = scheduleController
        state = PreferableEventViewEmptyTextState()
        state.update(context: self)
        self.scheduleController.objectWillChange.sink { [weak self] _ in
            self?.objectWillChange.send()
        }
        .store(in: &cancellables)
        preferableEventsArray = getEventsArray()
    }
    
    private func textChanged(oldValue: String, currentValue: String) {
        if text == "" && oldValue != "" {
            toEmptyTextState()
        }
        if text != "" && oldValue == "" {
            toEnteredTextState()
        }
    }
    
    func addButtonAction() {
        scheduleController.addPreferableEvent(text: text)
        preferableEventsArray = getEventsArray()
        toEmptyTextState()
    }
    
    func removeButtonAction(text: String) {
        scheduleController.removePreferableEvent(text: text)
        preferableEventsArray = getEventsArray()
    }
    
    func getEventsArray() -> [ScheduleItem] {
        scheduleController.schedule.preferableEvents ?? []
    }
    
    func isPreferableEventsNil() -> Bool {
        scheduleController.isPreferableEventsNil()
    }
    
    func isPreferableEventsNilOrEmpty() -> Bool {
        scheduleController.isPreferableEventsNilOrEmpty()
    }
}

extension PreferableEventViewModel {
    func transition(to state: PreferableEventViewState) {
        self.state = state
        self.state.update(context: self)
    }
    
    func toEmptyTextState() {
        state.toEmptyTextState()
    }
    
    func toEnteredTextState() {
        state.toEnteredTextState()
    }
}
