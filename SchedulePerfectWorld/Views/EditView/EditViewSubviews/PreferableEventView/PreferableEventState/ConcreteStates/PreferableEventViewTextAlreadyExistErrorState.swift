//
//  PreferableEventViewTextAlreadyExistErrorState.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 11.06.2024.
//

import Foundation

final class PreferableEventViewTextAlreadyExistErrorState: PreferableEventViewBaseState {
    override func toEmptyTextState() {
        context?.text = ""
        context?.showErrorCaption = false
        context?.textFieldBorderColor = nil
        context?.isAddButtonDisabled = true
        context?.transition(to: PreferableEventViewEmptyTextState())
    }
    override func toEnteredTextState() { 
        context?.textFieldBorderColor = nil
        context?.showErrorCaption = false
        context?.isAddButtonDisabled = false
        context?.transition(to: PreferableEventViewWithTextState())
    }
}
