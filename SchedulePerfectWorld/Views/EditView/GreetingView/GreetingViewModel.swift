//
//  GreetingEditViewModel.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 04.06.2024.
//

import SwiftUI

final class GreetingViewModel: ObservableObject, GreetingViewContext {
    
    private var scheduleController: ScheduleController
    
    @Published var state: TextViewWithButtonState
    
    var text: String = "" {
        didSet {
            textChanged()
        }
    }
    
    var buttonImageTitle: String = AddOrRemoveButtonTitle.plus.rawValue
    var buttonIsActive = false {
        didSet {
            buttonIsActive ? (buttonTintColor = .buttonIsActive) : (buttonTintColor = .gray)
        }
    }
    
    var buttonTintColor: Color = .gray
    
    init(scheduleController: ScheduleController) {
        self.scheduleController = scheduleController
        if scheduleController.isDefaultGreeting() {
            state = EmptyTextFieldState()
            state.update(context: self)
        } else {
            text = scheduleController.getGreeting()
            state = TextFieldWithTextState()
            state.update(context: self)
            state.toAddedTextState()
        }
    }
    
    func buttonAction() {
        isAddedState() ? toRemovedTextState() : toAddedTextState()
    }
    
    func isEditableView() -> Bool {
        !isAddedState()
    }
    
    private func isAddedState() -> Bool {
        state is AddedTextState
    }
    
    private func textChanged() {
        text != "" ? toEnteredTextState() : toEmptyTextState()
    }
}

extension GreetingViewModel {
    func transition(to state: TextViewWithButtonState) {
        self.state = state
        self.state.update(context: self)
    }
    
    private func toEnteredTextState() {
        state.toEnteredTextState()
    }
    
    private func toEmptyTextState() {
        state.toEmptyTextState()
    }
    
    private func toAddedTextState() {
        state.toAddedTextState()
        scheduleController.setGreeting(text)
    }
    private func toRemovedTextState() {
        state.toRemovedTextState()
        scheduleController.resetGreetingToDefault()
    }
}
