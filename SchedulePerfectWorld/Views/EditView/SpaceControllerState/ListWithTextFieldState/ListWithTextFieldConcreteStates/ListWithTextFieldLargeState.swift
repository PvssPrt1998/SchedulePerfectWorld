//
//  ListWithTextFieldLargeState.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 12.06.2024.
//

import Foundation

final class ListWithTextFieldLargeState: ListWithTextFieldBaseState {
    override func toNormal() {
        context?.listScrollDisabled = true
        context?.underListViewBottomSpacing = 0
        context?.spacingUnderAddTextField = 0
        context?.addTextFieldOffset = 0
        context?.moveUpOffset = 0
        context?.listWithTextFieldStateTransition(to: ListWithTextFieldNormalState())
    }
}
