//
//  ColorSchemeController.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 06.06.2024.
//

import SwiftUI
import Combine

class ColorSchemeController: ObservableObject {
    @AppStorage("appearance") var appearance: Appearance = .light {
        didSet {
            colorScheme = appearance.getColorScheme()
        }
    }
    
    @Published var colorScheme: ColorScheme?
    
    init() {
        self.colorScheme = appearance.getColorScheme()
    }
    
    func isDarkMode() -> Bool {
        return appearance == .dark
        
    }
}
