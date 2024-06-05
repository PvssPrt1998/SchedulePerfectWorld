//
//  EditView1.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 04.06.2024.
//

import SwiftUI

struct EditView1: View {
    
    var viewModel: EditViewModel
    
    var body: some View {
        ZStack {
            Color.element
                .ignoresSafeArea()
            VStack {
                GreetingEditView(viewModel: viewModel.greetingEditViewModel)
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    EditView1(viewModel: EditViewModel(scheduleController: ScheduleController()))
}
