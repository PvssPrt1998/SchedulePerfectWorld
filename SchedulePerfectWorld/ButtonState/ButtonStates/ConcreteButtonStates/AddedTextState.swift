//
//  CustomGreetingTextState.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 05.06.2024.
//

import Foundation

class AddedTextState: BaseState {
    override func toRemovedTextState() {
        context?.buttonIsActive = false
        context?.buttonImageTitle = "plus"
        context?.text = ""
        context?.transition(to: EmptyTextFieldState())
    }
}
