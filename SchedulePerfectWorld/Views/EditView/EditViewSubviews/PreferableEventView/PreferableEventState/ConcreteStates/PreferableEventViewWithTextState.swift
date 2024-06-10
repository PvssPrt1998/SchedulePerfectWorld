//
//  PreferableEventViewWithTextState.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 07.06.2024.
//

import Foundation

final class PreferableEventViewWithTextState: PreferableEventViewBaseState {
    override func toEmptyTextState() {
        context?.isAddButtonDisabled = true
        context?.text = ""
        context?.textFieldBorderColor = nil
        context?.transition(to: PreferableEventViewEmptyTextState())
    }
    
    override func toEventAlreadyExistErrorState() {
        context?.showErrorCaption = true
        context?.isAddButtonDisabled = true
        context?.textFieldBorderColor = .red
        context?.transition(to: PreferableEventViewTextAlreadyExistErrorState())
    }
}
