//
//  PreventiveWorkView.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 05.06.2024.
//

import SwiftUI

struct PreventiveWorkView: View {
    
    @ObservedObject var viewModel: PreventiveWorkViewModel
    
    var body: some View {
        VStack(spacing: 2) {
            CaptionText(text: "Профилактические работы")
                .padding(.leading, 9)
            HStack {
                if viewModel.isAddedState() {
                    AddedText(text: viewModel.getPreventiveWorkText())
                } else {
                    DatePickerView(title: "Начало: ", time: $viewModel.beginTime)
                        .padding(.leading, 9)
                    DatePickerView(title: "Конец: ", time: $viewModel.endTime)
                }
                Spacer()
                AddOrRemoveButton(imageTitle: viewModel.buttonImageTitle,
                                  imageTintColor: viewModel.buttonTingColor,
                                  action: viewModel.buttonAction)
            }
        }
    }
}

#Preview {
    PreventiveWorkView(viewModel: PreventiveWorkViewModel(scheduleController: ScheduleController()))
}
