//
//  AddPreferableEventView.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 17.05.2024.
//

import SwiftUI

struct AddPreferableEventView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        HStack {
            TextFieldWithBorderView(binding: $viewModel.preferableEventsStateManager.preferableEventText)
            
            PlusButton(buttonTintColor: viewModel.preferableEventsStateManager.buttonTintColor) {
                if viewModel.schedule.preferableEvents == nil {
                    viewModel.schedule.preferableEvents = [viewModel.preferableEventsStateManager.makeScheduleItem()]
                } else {
                    viewModel.schedule.preferableEvents!.append(viewModel.preferableEventsStateManager.makeScheduleItem())
                }
                viewModel.preferableEventsStateManager.preferableEventText = ""
            }
            .disabled(viewModel.preferableEventsStateManager.buttonDisabled)
        }
    }
}

#Preview {
    AddPreferableEventView()
        .padding()
        .frame(width: 300, height: 100)
        .background(Color.element)
        .environmentObject(ViewModel())
}
