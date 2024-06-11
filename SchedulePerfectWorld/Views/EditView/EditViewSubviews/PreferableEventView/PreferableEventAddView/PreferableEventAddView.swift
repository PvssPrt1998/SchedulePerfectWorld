//
//  PreferableEventAddView.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 11.06.2024.
//

import SwiftUI

struct PreferableEventAddView: View {
    
    @ObservedObject var viewModel: PreferableEventAddViewModel
    
    var body: some View {
        VStack(spacing: 2) {
            HStack {
                CaptionText(text: viewModel.captionText, color: viewModel.captionColor)
                Spacer()
            }
            HStack {
                TextFieldWithBorderView(binding: $viewModel.text, borderColor: viewModel.textFieldBorderColor)
                Spacer()
                AddOrRemoveButton(imageTitle: "plus",
                                  imageTintColor: viewModel.addButtonTintColor,
                                  action: viewModel.addButtonAction)
                .disabled(viewModel.isAddButtonDisabled)
            }
        }
    }
}

#Preview {
    PreferableEventAddView(viewModel: PreferableEventAddViewModel(scheduleController: ScheduleController()))
}
