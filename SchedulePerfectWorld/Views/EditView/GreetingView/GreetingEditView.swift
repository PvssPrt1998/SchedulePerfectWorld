//
//  GreetingEditView.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 04.06.2024.
//

import SwiftUI

struct GreetingEditView: View {
    
    @ObservedObject var viewModel: GreetingViewModel
    
    var body: some View {
        VStack(spacing: 4) {
            HStack {
                Text("Изменить приветствие")
                    .font(.caption)
                    .lineLimit(1)
                    .foregroundStyle(.gray)
                Spacer()
            }
            HStack {
                if viewModel.isEditableView() {
                    TextFieldWithBorderView(binding: $viewModel.text)
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
    GreetingEditView(viewModel: GreetingViewModel(scheduleController: ScheduleController()))
}
