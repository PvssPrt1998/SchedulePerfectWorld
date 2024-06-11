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
        ZStack {
            Color.element
                .ignoresSafeArea()
            ScrollViewReader { scrollValue in
                ScrollView(.vertical) {
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
                            GeometryReader {proxy in
                                Color.clear.padding().onAppear(perform: {
                                    spaceController.height = proxy.size.height
                                })
                            }
                        )
                        PreferableEventView(viewModel: viewModel.preferableEventViewModel, 
                                            focused: $focusedField,
                                            spaceController: spaceController)
                        Spacer()
                    }
                    .padding()
                }
                .content.offset(x: 0, y: spaceController.offset)
                .scrollDisabled(true)
            }
        }
        .onTapGesture {
            focusedField = nil
        }
    }
}

#Preview {
    EditView(viewModel: EditViewModel(scheduleController: ScheduleController(), colorSchemeController: ColorSchemeController()))
}
