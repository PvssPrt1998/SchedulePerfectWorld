//
//  ListState.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 12.06.2024.
//

import SwiftUI

protocol ListState {
    
    func update(context: ListStateContext)
    
    func toNormal()
    func toLarge()
}
