//
//  TextFieldWithTextState.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 05.06.2024.
//

import SwiftUI

class TextFieldWithTextState: BaseState {
    override func toEmptyTextState() {
        context?.buttonIsActive = false
        context?.transition(to: EmptyTextFieldState())
    }
    
    override func toAddedTextState() {
        context?.buttonImageTitle = "minus"
        context?.buttonIsActive = true
        context?.transition(to: AddedTextState())
    }
}
