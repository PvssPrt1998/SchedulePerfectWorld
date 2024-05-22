//
//  PreferableEventsViewModel.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 19.05.2024.
//

import SwiftUI

class PreferableEventsViewStateManager: ObservableObject {
    
    @Published var isPreferableEventOn: Bool = false
    
    @Published var preferableEventText: String = "" {
        didSet {
            if preferableEventText != "" { buttonDisabled = false }
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
    
    func makeScheduleItem() -> ScheduleItem {
        ScheduleItem(description: preferableEventText)
    }
}
