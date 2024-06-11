//
//  PreferableEventState.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 07.06.2024.
//

import Foundation

protocol PreferableEventAddViewState {
    
    func update(context: PreferableEventContext)
    
    func toEnteredTextState()
    func toEmptyTextState()
    func toEventAlreadyExistErrorState()
}
