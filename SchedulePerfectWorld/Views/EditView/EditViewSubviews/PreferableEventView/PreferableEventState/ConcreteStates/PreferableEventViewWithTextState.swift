//
//  PreferableEventViewWithTextState.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 07.06.2024.
//

import Foundation

final class PreferableEventViewWithTextState: PreferableEventViewBaseState {
    override func toEmptyTextState() {
        context?.text = ""
        addBbuttonToInactiveState()
        context?.transition(to: PreferableEventViewEmptyTextState())
    }
    
    override func toEventAlreadyExistErrorState() {
        textFieldBorderErrorState()
        captionErrorState()
        addBbuttonToInactiveState()
        context?.transition(to: PreferableEventViewTextAlreadyExistErrorState())
    }
}
