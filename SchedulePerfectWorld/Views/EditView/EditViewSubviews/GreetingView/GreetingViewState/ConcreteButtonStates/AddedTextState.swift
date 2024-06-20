//
//  CustomGreetingTextState.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 05.06.2024.
//

import Foundation

class AddedTextState: GreetingViewBaseState {
    override func toRemovedTextState() {
        context?.buttonIsActive = false
        context?.buttonTintColor = .gray
        context?.buttonImageTitle = AddOrRemoveButtonTitle.plus.rawValue
        context?.text = ""
        context?.transition(to: EmptyTextFieldState())
    }
}
