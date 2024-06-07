//
//  GreetingEditView.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 04.06.2024.
//

import SwiftUI

struct GreetingView: View {
    
    @ObservedObject var viewModel: GreetingViewModel
    
    var body: some View {
        VStack(spacing: 2) {
            CaptionText(text: "Изменить приветствие")
            HStack {
                if viewModel.isEditableView() {
                    TextFieldWithBorderView(binding: $viewModel.text,
                                            submitAction: viewModel.buttonAction)
                } else {
                    AddedText(text: viewModel.text)
                }
                Spacer()
                AddOrRemoveButton(
                    imageTitle: viewModel.buttonImageTitle,
                    imageTintColor: viewModel.buttonTintColor,
                    action: viewModel.buttonAction)
                .disabled(!viewModel.buttonIsActive)
            }
        }
    }
}

#Preview {
    GreetingView(viewModel: GreetingViewModel(scheduleController: ScheduleController()))
}
