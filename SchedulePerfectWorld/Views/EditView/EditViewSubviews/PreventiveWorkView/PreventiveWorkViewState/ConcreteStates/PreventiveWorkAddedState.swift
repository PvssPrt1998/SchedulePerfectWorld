//
//  PreventiveWorkAddedState.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 06.06.2024.
//

import Foundation

final class PreventiveWorkAddedState: PreventiveWorkBaseState {
    override func toNotAddedState() {
        context?.buttonImageTitle = AddOrRemoveButtonTitle.plus.rawValue
        context?.transition(to: PreventiveWorkNotAddedState())
    }
}
