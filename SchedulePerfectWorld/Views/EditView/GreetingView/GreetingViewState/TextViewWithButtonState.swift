//
//  ButtonState.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 05.06.2024.
//

import SwiftUI

protocol TextViewWithButtonState {
    
    func update(context: GreetingViewContext)
    
    func toEnteredTextState()
    func toEmptyTextState()
    func toAddedTextState()
    func toRemovedTextState()
}
