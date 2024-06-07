//
//  ColorSchemeViewModel.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 06.06.2024.
//

import SwiftUI

final class ColorSchemeViewModel: ObservableObject {
    
    var colorSchemeController: ColorSchemeController
    
    @Published var darkMode: Bool {
        didSet {
            if darkMode {
                colorSchemeController.appearance = .dark
            } else {
                colorSchemeController.appearance = .light
            }
        }
    }
    
    init(colorSchemeController: ColorSchemeController) {
        self.colorSchemeController = colorSchemeController
        self.darkMode = colorSchemeController.isDarkMode()
    }
}
