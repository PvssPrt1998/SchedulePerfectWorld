//
//  ColorSchemeViewModel.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 19.05.2024.
//

import SwiftUI

class ColorSchemeStateManager {
    @AppStorage("appearance") var appearance: Appearance = .light
    var darkMode: Bool = false {
        didSet {
            if darkMode == true {
                appearance = .dark
            } else {
                appearance = .light
            }
        }
    }
    
    init() {
        if appearance == .dark {
            darkMode = true
        } else { darkMode = false }
    }
}
