//
//  PreferableEventView.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 17.05.2024.
//

import SwiftUI

struct PreferableEventView: View {

    var viewModel: PreferableEventViewModel
    var focused: FocusState<EditView.Field?>.Binding
    @ObservedObject var spaceController: SpaceController
    @Environment(\.keyboardHeight) var keyboardHeight
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                PreferableEventAddView(viewModel: viewModel.preferableEventAddViewModel, focused: focused, spaceController: spaceController).hidden()
                Spacer().frame(height: spaceController.spacingUnderAddTextField)
                PreferableEventsListView(viewModel: viewModel.preferableEventsListViewModel, spaceController: spaceController, focused: focused)
                Spacer().frame(height: spaceController.underListViewBottomSpacing)
            }
            .padding(.top, 8)
                PreferableEventAddView(viewModel: viewModel.preferableEventAddViewModel, focused: focused, spaceController: spaceController)
                    .background(
                        GeometryReader { preferableEventAddViewGeometry in
                            Color.clear.padding().onAppear(perform: {
                                spaceController.addTextFieldHeight = preferableEventAddViewGeometry.size.height
                            })
                        }
                    )
                    .offset(x: 0, y: spaceController.addTextFieldOffset - keyboardHeight)
        }
    }
}

struct PreferableEventView_Preview: PreviewProvider {
    @FocusState static var focused: EditView.Field?
    @State static var text = ""
    static var previews: some View {
        PreferableEventView(viewModel: PreferableEventViewModel(scheduleController: ScheduleController()),
                            focused: $focused,
                            spaceController: SpaceController())
    }
}
