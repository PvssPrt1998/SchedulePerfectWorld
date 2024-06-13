//
//  GreetingEditView.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 04.06.2024.
//

import SwiftUI

struct GreetingView: View {
    
    @ObservedObject var viewModel: GreetingViewModel
    var focused: FocusState<EditView.Field?>.Binding
    
    var body: some View {
        VStack(spacing: 2) {
            CaptionText(text: "Изменить приветствие")
                .padding(.leading, 9)
            HStack {
                if viewModel.isEditableView() {
                    TextFieldWithBorderView(binding: $viewModel.text, focused: focused, field: EditView.Field.greetingField)
                        .onTapGesture { }
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

struct GreetingView_Preview : PreviewProvider {
    @FocusState static var focused: EditView.Field?
    @State static var text = ""
    static var previews: some View {
        GreetingView(viewModel: GreetingViewModel(scheduleController: ScheduleController()), focused: $focused)
    }
}
