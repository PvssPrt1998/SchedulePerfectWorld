//
//  PreferableEventAddViewModel.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 11.06.2024.
//

import SwiftUI
import Combine

final class PreferableEventAddViewModel: ObservableObject, PreferableEventContext {
    
    //MARK: - Properties
    @Published var scheduleController: ScheduleController
    private var cancellables = Set<AnyCancellable>()
    
    @Published var state: PreferableEventAddViewState
    
    @Published var text = "" {
        didSet {
            textChanged(oldValue: oldValue)
        }
    }
    
    var showErrorCaption: Bool = false
    var captionColor: Color?
    var captionText = "Особое событие"
    
    var textFieldBorderColor: Color?
    var addButtonTintColor: Color = .gray
    var isAddButtonDisabled: Bool = true
    
    //MARK: - Init
    init(scheduleController: ScheduleController) {
        self.scheduleController = scheduleController
        state = PreferableEventViewEmptyTextState()
        state.update(context: self)
    }
    
    //MARK: - Methods
    func addButtonAction() {
        if scheduleController.isPreferableEventAlreadyExist(text: text) {
            toEventAlreadyExistErrorState()
        } else {
            scheduleController.addPreferableEvent(text: text)
            toEmptyTextState()
        }
    }
    
    private func textChanged(oldValue: String) {
        textFromEmptyToEntered(oldValue: oldValue)
        textFromEnteredToEmpty(oldValue: oldValue)
        textFromEnteredToError(oldValue: oldValue)
    }
    
    private func textFromEmptyToEntered(oldValue: String) {
        if text != "" && oldValue == "" {
            toEnteredTextState()
        }
    }
    
    private func textFromEnteredToEmpty(oldValue: String) {
        if text == "" && oldValue != "" {
            toEmptyTextState()
        }
    }
    
    private func textFromEnteredToError(oldValue: String) {
        if oldValue != "" && isErrorState() {
            if text == "" {
                toEmptyTextState()
            }
            if text != "" {
                toEnteredTextState()
            }
        }
    }
}

extension PreferableEventAddViewModel {
    func transition(to state: PreferableEventAddViewState) {
        self.state = state
        self.state.update(context: self)
    }
    
    func toEmptyTextState() {
        state.toEmptyTextState()
    }
    
    func toEnteredTextState() {
        state.toEnteredTextState()
    }
    
    func toEventAlreadyExistErrorState() {
        state.toEventAlreadyExistErrorState()
    }
    
    func isErrorState() -> Bool {
        state is PreferableEventViewTextAlreadyExistErrorState
    }
}
