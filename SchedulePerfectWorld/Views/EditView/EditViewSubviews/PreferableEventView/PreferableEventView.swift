//
//  PreferableEventView.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 17.05.2024.
//

import SwiftUI

struct PreferableEventView: View {
    
    @ObservedObject var viewModel: PreferableEventViewModel
    
    var body: some View {
        VStack {
            CaptionText(text: "Особые события")
            HStack {
                TextFieldWithBorderView(binding: $viewModel.text,
                                        submitAction: viewModel.addButtonAction)
                Spacer()
                AddOrRemoveButton(imageTitle: "plus",
                                  imageTintColor: viewModel.tintColor,
                                  action: viewModel.addButtonAction)
                .disabled(viewModel.isAddButtonDisabled)
            }
            if !viewModel.isPreferableEventsNilOrEmpty() {
                VStack(spacing: 2) {
                    ForEach(viewModel.getEventsArray(), id: \.self) { item in
                        HStack {
                            AddedText(text: item.description)
                            Spacer()
                            AddOrRemoveButton(imageTitle: "minus", 
                                              imageTintColor: .buttonIsActive) {
                                viewModel.removeButtonAction(text: item.description)
                            }
                        }
                    }
                }
                .background(Color.white)
                .clipShape(.rect(cornerRadius: 8))
            }
        }
    }
}

#Preview {
    PreferableEventView(viewModel: PreferableEventViewModel(scheduleController: ScheduleController()))
}
