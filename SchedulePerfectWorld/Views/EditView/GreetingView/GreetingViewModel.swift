//
//  GreetingEditViewModel.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 04.06.2024.
//

import SwiftUI

final class GreetingViewModel: ObservableObject, Context {
    
    var scheduleController: ScheduleController
    
    @Published var greetingViewState: TextViewWithButtonState
    
    var text: String = "" {
        didSet {
            textChanged()
        }
    }
    
    var buttonImageTitle: String = "plus"
    var buttonIsActive = false {
        didSet {
            buttonIsActive ? (buttonTintColor = .buttonIsActive) : (buttonTintColor = .gray)
        }
    }
    
    var buttonTintColor: Color = .gray
    
    init(scheduleController: ScheduleController) {
        self.scheduleController = scheduleController
        if scheduleController.getGreeting() == scheduleController.defaultGreeting {
            greetingViewState = EmptyTextFieldState()
            greetingViewState.update(context: self)
        } else {
            text = scheduleController.getGreeting()
            greetingViewState = TextFieldWithTextState()
            greetingViewState.update(context: self)
            greetingViewState.toAddedTextState()
        }
    }
    
    func buttonAction() {
        isAddedState() ? toRemovedTextState() : toAddedTextState()
    }
    
    func isEditableView() -> Bool {
        !isAddedState()
    }
    
    private func isAddedState() -> Bool {
        greetingViewState is AddedTextState ? true : false
    }
    
    private func textChanged() {
        text != "" ? toEnteredTextState() : toEmptyTextState()
    }
    
    //MARK: - View State Methods
    func transition(to state: TextViewWithButtonState) {
        greetingViewState = state
        greetingViewState.update(context: self)
    }
    
    private func toEnteredTextState() {
        greetingViewState.toEnteredTextState()
    }
    
    private func toEmptyTextState() {
        greetingViewState.toEmptyTextState()
    }
    
    private func toAddedTextState() {
        greetingViewState.toAddedTextState()
        scheduleController.setGreeting(text)
    }
    private func toRemovedTextState() {
        greetingViewState.toRemovedTextState()
        scheduleController.resetGreetingToDefault()
    }
}
