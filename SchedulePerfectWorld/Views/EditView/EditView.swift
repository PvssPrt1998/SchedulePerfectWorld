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
                ColorSchemeView(viewModel: viewModel.colorSchemeViewModel)
                Divider()
                GreetingView(viewModel: viewModel.greetingEditViewModel)
                Divider()
                PreventiveWorkView(viewModel: viewModel.preventiveWorkViewModel)
                Divider()
                PreferableEventView(viewModel: viewModel.preferableEventViewModel)
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    EditView(viewModel: EditViewModel(scheduleController: ScheduleController(), colorSchemeController: ColorSchemeController()))
}
