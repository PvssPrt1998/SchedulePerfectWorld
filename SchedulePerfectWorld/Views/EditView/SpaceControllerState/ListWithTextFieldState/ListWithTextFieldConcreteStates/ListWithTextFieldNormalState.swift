//
//  ListWithTextFieldNormalState.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 12.06.2024.
//

import Foundation

final class ListWithTextFieldNormalState: ListWithTextFieldBaseState {
    override func toLarge() {
        context?.listScrollDisabled = false
        context?.moveUpOffset = -elementsAboveTextField() - addTextFieldHeight() - getSafeAreaTop() * 2
        context?.addTextFieldOffset = -getMoveUpOffset() + (getScreenHeight() + getMoveUpOffset() - getSafeAreaTop() * 2)
        context?.spacingUnderAddTextField = getSafeAreaTop() * 2
        context?.underListViewBottomSpacing = addTextFieldHeight()
        context?.listWithTextFieldStateTransition(to: ListWithTextFieldLargeState())
    }
    
    private func getScreenHeight() -> CGFloat {
        context?.screenHeight ?? 0
    }
    
    private func getMoveUpOffset() -> CGFloat {
        context?.moveUpOffset ?? 0
    }
    
    private func getSafeAreaTop() -> CGFloat {
        context?.safeAreaTop ?? 0
    }
    
    func addTextFieldHeight() -> CGFloat {
        context?.addTextFieldHeight ?? 0
    }
    
    func elementsAboveTextField() -> CGFloat {
        context?.elementsAboveAddTextFieldHeight ?? 0
    }
    
    func spacingUnderAddTextField() -> CGFloat {
        context?.spacingUnderAddTextField ?? 0
    }
}
