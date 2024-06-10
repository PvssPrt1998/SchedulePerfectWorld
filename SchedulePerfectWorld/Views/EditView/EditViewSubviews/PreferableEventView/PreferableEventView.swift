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
            VStack(spacing: 2) {
                HStack {
                    if viewModel.showErrorCaption {
                        CaptionText(text: "Событие уже существует", color: .red)
                    } else {
                        CaptionText(text: "Особые события")
                    }
                    Spacer()
                }
                HStack {
                    TextFieldWithBorderView(binding: $viewModel.text, borderColor: viewModel.textFieldBorderColor)
                    Spacer()
                    AddOrRemoveButton(imageTitle: "plus",
                                      imageTintColor: viewModel.tintColor,
                                      action: viewModel.addButtonAction)
                    .disabled(viewModel.isAddButtonDisabled)
                }
            }
            if !viewModel.isPreferableEventsNilOrEmpty() {
                ScrollView {
                    LazyVStack(spacing: 2) {
                        ForEach(viewModel.preferableEventsArray, id: \.self) { item in
                            VStack {
                                HStack {
                                    AddedText(text: item.description)
                                    Spacer()
                                    AddOrRemoveButton(imageTitle: "minus", 
                                                      imageTintColor: .buttonIsActive) {
                                        viewModel.removeButtonAction(text: item.description)
                                    }
                                }
                                if item != viewModel.preferableEventsArray.last && viewModel.preferableEventsArray.count != 1 {
                                    Divider()
                                }
                            }
                        }
                    }
                    .background(Color.preferableEventsListBackground)
                .clipShape(.rect(cornerRadius: 8))
                }
                .scrollBounceBehavior(.basedOnSize)
            }
        }
    }
}

#Preview {
    PreferableEventView(viewModel: PreferableEventViewModel(scheduleController: ScheduleController()))
}
