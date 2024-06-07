//
//  EditView1.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 04.06.2024.
//

import SwiftUI

struct EditView: View {
    
    var viewModel: EditViewModel
    
    var body: some View {
        ZStack {
            Color.element
                .ignoresSafeArea()
            VStack(spacing: 16) {
                GreetingView(viewModel: viewModel.greetingEditViewModel)
                PreventiveWorkView(viewModel: viewModel.preventiveWorkViewModel)
                ColorSchemeView(viewModel: viewModel.colorSchemeViewModel)
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    EditView(viewModel: EditViewModel(scheduleController: ScheduleController(), colorSchemeController: ColorSchemeController()))
}
