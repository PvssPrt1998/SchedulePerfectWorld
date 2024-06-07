//
//  EmptyTextFieldState.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 05.06.2024.
//

import SwiftUI

class EmptyTextFieldState: GreetingViewBaseState {
    override func toEnteredTextState() {
        context?.buttonIsActive = true
        context?.transition(to: TextFieldWithTextState())
    }
}
