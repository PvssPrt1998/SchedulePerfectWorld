//
//  ColorSchemeView.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 06.06.2024.
//

import SwiftUI

struct ColorSchemeView: View {
    
    @ObservedObject var viewModel: ColorSchemeViewModel
    
    var body: some View {
        Toggle("Темная тема", isOn: $viewModel.darkMode)
    }
}

#Preview {
    ColorSchemeView(viewModel: ColorSchemeViewModel(colorSchemeController: ColorSchemeController()))
}
