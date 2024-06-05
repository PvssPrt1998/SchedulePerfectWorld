//
//  EditView.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 17.05.2024.
//

import SwiftUI

struct EditView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            VStack {
                Toggle("Темная тема", isOn: $viewModel.colorSchemeStateManager.darkMode)
                GreetingView()
                PreventiveWorkView()
                PreferableEventView()
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    EditView()
        .environmentObject(ViewModel())
}
