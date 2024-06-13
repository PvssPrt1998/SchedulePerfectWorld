//
//  ListNormalState.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 12.06.2024.
//

import Foundation

final class ListNormalState: ListBaseState {
    
    override func toLarge() {
        context?.listScrollDisabled = false
        context?.spacingUnderAddTextField = safeAreaTop() * 2
        context?.moveUpOffset = -elementsAboveTextField() - addTextFieldHeight() - spacingUnderAddTextField()
        context?.listStateTransition(to: ListLargeState())
    }
    
    func elementsAboveTextField() -> CGFloat {
        context?.elementsAboveAddTextFieldHeight ?? 0
    }
    
    func addTextFieldHeight() -> CGFloat {
        context?.addTextFieldHeight ?? 0
    }
    
    func safeAreaTop() -> CGFloat {
        context?.safeAreaTop ?? 0
    }
    
    func spacingUnderAddTextField() -> CGFloat {
        context?.spacingUnderAddTextField ?? 0
    }
}
