//
//  ListWithTextFieldState.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 12.06.2024.
//

import Foundation

protocol ListWithTextFieldState {
    func update(context: ListWithTextFieldContext)
    
    func toNormal()
    func toLarge()
}
