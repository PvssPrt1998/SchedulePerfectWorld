//
//  TextViewWithButtonContext.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 05.06.2024.
//

import SwiftUI

protocol GreetingViewContext: AnyObject {
    var text: String { get set }
    var buttonIsActive: Bool { get set }
    var buttonImageTitle: String { get set }
    var buttonTintColor: Color { get set }
    
    func transition(to state: GreetingViewState)
}
