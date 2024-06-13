//
//  EditView1.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 04.06.2024.
//

import SwiftUI

struct EditView: View {

    enum Field: Hashable {
        case greetingField
        case preferableEventField
    }
    
    @StateObject var spaceController = SpaceController()
    
    @FocusState var focusedField: Field?
    
    var viewModel: EditViewModel
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.element
                    .ignoresSafeArea()
                VStack(spacing: 16) {
                    VStack(spacing: 16) {
                        ColorSchemeView(viewModel: viewModel.colorSchemeViewModel)
                        Divider()
                        GreetingView(viewModel: viewModel.greetingEditViewModel, focused: $focusedField)
                        Divider()
                        PreventiveWorkView(viewModel: viewModel.preventiveWorkViewModel)
                        Divider()
                    }
                    .background(
                        GeometryReader { vStackGeometry in
                            Color.clear.padding().onAppear(perform: {
                                spaceController.elementsAboveAddTextFieldHeight = vStackGeometry.size.height
                            })
                        }
                    )
                    PreferableEventView(viewModel: viewModel.preferableEventViewModel,
                                        focused: $focusedField,
                                        spaceController: spaceController)
                        .keyboardHeightEnvironmentValue()
                    Spacer()
                }//VStack
                .padding()
            }//ZStack
            .offset(x: 0, y: spaceController.moveUpOffset)
            .frame(height: proxy.size.height - spaceController.moveUpOffset)
            .background(
                GeometryReader { editViewGeometry in
                    Color.clear.onAppear(perform: {
                        DispatchQueue.main.async {
                            spaceController.screenHeight = editViewGeometry.size.height
                            spaceController.safeAreaTop = editViewGeometry.safeAreaInsets.top
                            spaceController.safeAreaBottomHeight = editViewGeometry.safeAreaInsets.bottom
                        }
                    })
                }
            )
            .onTapGesture {
                focusedField = nil
            }
            .ignoresSafeArea(.keyboard)
        }
    }
}

#Preview {
    EditView(viewModel: EditViewModel(scheduleController: ScheduleController(), colorSchemeController: ColorSchemeController()))
}
