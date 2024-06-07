//
//  PreventiveViewContext.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 06.06.2024.
//

import Foundation

protocol PreventiveWorkViewContext: AnyObject {
    var buttonImageTitle: String { get set }
    
    func transition(to state: PreventiveWorkViewState)
}
