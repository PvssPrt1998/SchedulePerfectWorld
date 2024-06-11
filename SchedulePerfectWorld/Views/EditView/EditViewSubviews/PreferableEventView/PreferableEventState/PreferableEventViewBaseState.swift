//
//  PreferableEventViewBaseState.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 07.06.2024.
//

import SwiftUI

class PreferableEventViewBaseState: PreferableEventAddViewState {
    
    private(set) weak var context: PreferableEventContext?
    
    func update(context: PreferableEventContext) {
        self.context = context
    }
    
    func toEnteredTextState() { }
    func toEmptyTextState() { }
    func toEventAlreadyExistErrorState() { }
    
    func captionErrorState() {
        context?.showErrorCaption = true
        context?.captionColor = .red
        context?.captionText = "Событие уже существует"
    }
    
    func captionNormalState() {
        context?.showErrorCaption = false
        context?.captionColor = nil
        context?.captionText = "Особое событие"
    }
    
    func textFieldBorderErrorState() {
        context?.textFieldBorderColor = .red
    }
    
    func textFieldBorderNormalState() {
        context?.textFieldBorderColor = nil
    }
    
    func addButtonToActiveState() {
        context?.isAddButtonDisabled = false
        context?.addButtonTintColor = .buttonIsActive
    }
    
    func addBbuttonToInactiveState() {
        context?.isAddButtonDisabled = true
        context?.addButtonTintColor = .gray
    }
}

