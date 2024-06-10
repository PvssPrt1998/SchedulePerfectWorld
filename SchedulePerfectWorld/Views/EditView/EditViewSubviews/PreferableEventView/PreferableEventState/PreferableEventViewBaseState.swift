//
//  PreferableEventViewBaseState.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 07.06.2024.
//

import SwiftUI

class PreferableEventViewBaseState: PreferableEventViewState {
    
    private(set) weak var context: PreferableEventContext?
    
    func update(context: PreferableEventContext) {
        self.context = context
    }
    
    func toEnteredTextState() { }
    func toEmptyTextState() { }
    func toEventAlreadyExistErrorState() { }
}

