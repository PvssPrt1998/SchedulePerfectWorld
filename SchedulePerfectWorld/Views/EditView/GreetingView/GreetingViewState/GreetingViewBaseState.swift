//
//  BaseButtonState.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 05.06.2024.
//

import SwiftUI

class GreetingViewBaseState: TextViewWithButtonState {
    
    private(set) weak var context: GreetingViewContext?
    
    func update(context: GreetingViewContext) {
        self.context = context
    }
    
    func toEnteredTextState() { }
    func toEmptyTextState() { }
    func toAddedTextState() { }
    func toRemovedTextState() { }
}
