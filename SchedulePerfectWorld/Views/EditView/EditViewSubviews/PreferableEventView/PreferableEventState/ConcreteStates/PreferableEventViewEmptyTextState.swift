//
//  PreferableEventviewEmptyTextState.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 07.06.2024.
//

import SwiftUI

final class PreferableEventViewEmptyTextState: PreferableEventViewBaseState {
    override func toEnteredTextState() {
        context?.isAddButtonDisabled = false
        context?.textFieldBorderColor = nil
        context?.transition(to: PreferableEventViewWithTextState())
    }
}

