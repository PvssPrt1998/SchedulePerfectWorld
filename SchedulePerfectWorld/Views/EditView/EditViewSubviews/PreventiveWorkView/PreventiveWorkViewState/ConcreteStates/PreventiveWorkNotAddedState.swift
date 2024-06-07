//
//  PreventiveWorkNotAddedState.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 06.06.2024.
//

import Foundation

final class PreventiveWorkNotAddedState: PreventiveWorkBaseState {
    override func toAddedState() {
        context?.buttonImageTitle = AddOrRemoveButtonTitle.minus.rawValue
        context?.transition(to: PreventiveWorkAddedState())
    }
}

