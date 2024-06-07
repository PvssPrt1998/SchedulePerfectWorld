//
//  PreventiveViewState.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 06.06.2024.
//

import Foundation

protocol PreventiveWorkViewState {
    
    func update(context: PreventiveWorkViewContext)
    
    func toAddedState()
    func toNotAddedState()
}
