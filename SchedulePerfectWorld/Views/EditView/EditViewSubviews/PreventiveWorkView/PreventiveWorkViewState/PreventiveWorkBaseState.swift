//
//  PreventiveWorkBaseState.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 06.06.2024.
//

import Foundation

class PreventiveWorkBaseState: PreventiveWorkViewState {

    private(set) weak var context: PreventiveWorkViewContext?
    
    func update(context: PreventiveWorkViewContext) {
        self.context = context
    }
    
    func toAddedState() { }
    func toNotAddedState() { }
}
