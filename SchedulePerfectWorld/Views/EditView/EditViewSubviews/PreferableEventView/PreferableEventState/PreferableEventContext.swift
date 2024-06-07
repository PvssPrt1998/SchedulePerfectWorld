//
//  PreferableEventContext.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 07.06.2024.
//

import Foundation

protocol PreferableEventContext: AnyObject {
    
    var text: String { get set }
    var isAddButtonDisabled: Bool { get set }
    
    func transition(to state: PreferableEventViewState)
}
