//
//  CustomGreetingView.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 19.05.2024.
//

import SwiftUI

struct GreetingView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        Toggle("Изменить приветствие", isOn: $viewModel.greetingViewStateManager.customGreetingIsOn)
        if viewModel.greetingViewStateManager.customGreetingIsOn {
            HStack {
                if viewModel.schedule.greeting.description != viewModel.greetingViewStateManager.defaultGreeting {
                    AddedText(text: viewModel.greetingViewStateManager.customGreeting)
                } else {
                    TextFieldWithBorderView(binding: $viewModel.greetingViewStateManager.customGreeting)
                }
                
                Spacer()
                
                AddOrRemoveButton(isAddButtonState: $viewModel.greetingViewStateManager.isAddButtonState,
                                  buttonTintColor: viewModel.greetingViewStateManager.buttonTintColor
                ) {
                    viewModel.schedule.greeting.description = viewModel.greetingViewStateManager.customGreeting
                } removeAction: {
                    viewModel.schedule.greeting.description = viewModel.greetingViewStateManager.defaultGreeting
                    viewModel.greetingViewStateManager.customGreeting = ""
                }
                .disabled(viewModel.greetingViewStateManager.buttonDisabled)
            }
        }
    }
}

#Preview {
    GreetingView()
        .environmentObject(ViewModel())
}
