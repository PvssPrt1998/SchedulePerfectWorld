//
//  PreferableEventViewTextAlreadyExistErrorState.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 11.06.2024.
//

import Foundation

final class PreferableEventViewTextAlreadyExistErrorState: PreferableEventViewBaseState {
    override func toEmptyTextState() {
        captionNormalState()
        textFieldBorderNormalState()
        context?.transition(to: PreferableEventViewEmptyTextState())
    }
    override func toEnteredTextState() { 
        captionNormalState()
        textFieldBorderNormalState()
        addButtonToActiveState()
        context?.transition(to: PreferableEventViewWithTextState())
    }
}
