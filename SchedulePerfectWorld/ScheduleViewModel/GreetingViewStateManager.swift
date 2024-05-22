//
//  CustomGreetingViewModel.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 19.05.2024.
//

import SwiftUI

class GreetingViewStateManager {
    
    let defaultGreeting = "Доброе утро!"
    
    var customGreetingIsOn: Bool = false
    var customGreeting: String = "" {
        didSet {
            if customGreeting != "" { buttonDisabled = false }
            else { buttonDisabled = true }
        }
    }
    
    var isAddButtonState: Bool = true
    var buttonDisabled: Bool = true {
        didSet {
            if buttonDisabled == true {
                buttonTintColor = .gray
            } else { buttonTintColor = Color.buttonIsActive }
        }
    }
    
    var buttonTintColor = Color.gray
}
