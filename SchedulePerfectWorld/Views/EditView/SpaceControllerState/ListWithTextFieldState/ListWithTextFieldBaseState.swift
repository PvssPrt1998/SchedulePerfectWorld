//
//  ListWithTextFieldBaseState.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 12.06.2024.
//

import Foundation

import SwiftUI

class ListWithTextFieldBaseState: ListWithTextFieldState {
    
    private(set) weak var context: ListWithTextFieldContext?
    
    func update(context: ListWithTextFieldContext) {
        self.context = context
    }
    
    func toNormal() { }
    func toLarge() { }
}
