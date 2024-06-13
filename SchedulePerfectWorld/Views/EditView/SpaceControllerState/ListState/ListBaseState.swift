//
//  ListBaseState.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 12.06.2024.
//

import SwiftUI

class ListBaseState: ListState {
    
    
    private(set) weak var context: ListStateContext?
    
    func update(context: ListStateContext) {
        self.context = context
    }
    
    func toNormal() { }
    func toLarge() { }
}
