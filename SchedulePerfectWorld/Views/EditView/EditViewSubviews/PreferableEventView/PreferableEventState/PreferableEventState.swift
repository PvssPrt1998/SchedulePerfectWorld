//
//  PreferableEventState.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 07.06.2024.
//

import Foundation

protocol PreferableEventViewState {
    
    func update(context: PreferableEventContext)
    
    func toEnteredTextState()
    func toEmptyTextState()
}
