//
//  PreferableEventviewEmptyTextState.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 07.06.2024.
//

import SwiftUI

final class PreferableEventViewEmptyTextState: PreferableEventViewBaseState {
    override func toEnteredTextState() {
        addButtonToActiveState()
        context?.transition(to: PreferableEventViewWithTextState())
    }
}

