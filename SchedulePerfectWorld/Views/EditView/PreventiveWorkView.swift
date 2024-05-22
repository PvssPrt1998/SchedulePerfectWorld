//
//  PreventiveWorkView.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 17.05.2024.
//

import SwiftUI

struct PreventiveWorkView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        Toggle("Профилактические работы", isOn: $viewModel.preventiveWorkStateManager.isPreventiveWorkToday)
        if viewModel.preventiveWorkStateManager.isPreventiveWorkToday {
            HStack {
                if viewModel.schedule.preventiveWork == nil {
                    DatePickerView(title: "Начало: ", time: $viewModel.preventiveWorkStateManager.beginTime)
                    DatePickerView(title: "Конец: ", time: $viewModel.preventiveWorkStateManager.endTime)
                } else {
                    AddedText(text: viewModel.schedule.preventiveWork!.description)
                }
                Spacer()
                AddOrRemoveButton(isAddButtonState: $viewModel.preventiveWorkStateManager.isAddButtonState, 
                                  buttonTintColor: .buttonIsActive) {
                    viewModel.schedule.preventiveWork = viewModel.preventiveWorkStateManager.getPreventiveWorkScheduleItem()
                } removeAction: {
                    viewModel.schedule.preventiveWork = nil
                }
            }
        }
    }
}

#Preview {
    PreventiveWorkView()
        .environmentObject(ViewModel())
}
