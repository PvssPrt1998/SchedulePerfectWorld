//
//  PreferableEventAddView.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 11.06.2024.
//

import SwiftUI
import Combine

struct PreferableEventAddView: View, KeyboardReadable {
    
    @ObservedObject var viewModel: PreferableEventAddViewModel
    var focused: FocusState<EditView.Field?>.Binding
    var spaceController: SpaceController
    
    var body: some View {
        VStack(spacing: 2) {
            HStack {
                CaptionText(text: viewModel.captionText, color: viewModel.captionColor)
                    .padding(.leading, 9)
                Spacer()
            }
            HStack {
                TextFieldWithBorderView(binding: $viewModel.text,
                                        focused: focused, field: EditView.Field.preferableEventField,
                                        borderColor: viewModel.textFieldBorderColor)
                .onTapGesture { }
                .onReceive(keyboardPublisher) { newIsKeyboardVisible in
                    if newIsKeyboardVisible {
                        if focused.wrappedValue == .preferableEventField {
                            spaceController.listWithTextFieldToLargeState()
                        }
                    }
                    if !newIsKeyboardVisible {
                        if focused.wrappedValue == .preferableEventField {
                            spaceController.listWithTextFieldToNormalState()
                        }
                    }
                }
                Spacer()
                AddOrRemoveButton(imageTitle: "plus",
                                  imageTintColor: viewModel.addButtonTintColor,
                                  action: viewModel.addButtonAction)
                .disabled(viewModel.isAddButtonDisabled)
            }
        }
    }
}


struct PreferableEventAddView_Preview: PreviewProvider {
    @FocusState static var focused: EditView.Field?
    @State static var text = ""
    static var previews: some View {
        PreferableEventAddView(viewModel: PreferableEventAddViewModel(scheduleController: ScheduleController()), 
                               focused: $focused, spaceController: SpaceController())
    }
}
