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
        context?.transition(to: PreferableEventViewEmptyTextState())
    }
}
