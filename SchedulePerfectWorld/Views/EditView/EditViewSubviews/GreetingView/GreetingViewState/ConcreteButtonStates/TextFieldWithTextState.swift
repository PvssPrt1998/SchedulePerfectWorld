//
//  TextFieldWithTextState.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 05.06.2024.
//

import SwiftUI

class TextFieldWithTextState: GreetingViewBaseState {
    override func toEmptyTextState() {
        context?.buttonIsActive = false
        context?.buttonTintColor = .gray
        context?.transition(to: EmptyTextFieldState())
    }
    
    override func toAddedTextState() {
        context?.buttonImageTitle = AddOrRemoveButtonTitle.minus.rawValue
        context?.buttonIsActive = true
        context?.buttonTintColor = .buttonIsActive
        context?.transition(to: AddedTextState())
    }
}
