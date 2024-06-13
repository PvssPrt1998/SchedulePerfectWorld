//
//  ListLargeState.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 12.06.2024.
//

import Foundation

final class ListLargeState: ListBaseState {
    override func toNormal() {
        context?.listScrollDisabled = true
        context?.spacingUnderAddTextField = 0
        context?.moveUpOffset = 0
        context?.listStateTransition(to: ListNormalState())
    }
}
