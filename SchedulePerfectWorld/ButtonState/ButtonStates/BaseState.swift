//
//  BaseButtonState.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 05.06.2024.
//

import SwiftUI

class BaseState: TextViewWithButtonState {
    
    private(set) weak var context: Context?
    
    func update(context: Context) {
        self.context = context
    }
    
    func toEnteredTextState() { }
    func toEmptyTextState() { }
    func toAddedTextState() { }
    func toRemovedTextState() { }
}
