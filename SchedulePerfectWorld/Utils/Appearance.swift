//
//  Appearance.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 20.05.2024.
//

import SwiftUI

enum Appearance: Int, CaseIterable, Identifiable {
    case light, dark

    var id: Int { self.rawValue }

    var name: String {
        switch self {
            case .light: return "Light"
            case .dark: return "Dark"
        }
  }
  
    func getColorScheme() -> ColorScheme? {
        switch self {
            case .light: return .light
            case .dark: return .dark
        }
    }
}
