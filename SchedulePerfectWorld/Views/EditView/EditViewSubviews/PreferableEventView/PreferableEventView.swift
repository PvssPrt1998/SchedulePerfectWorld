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
    @State var offset: CGFloat = 0
    
    var body: some View {
        VStack {
            PreferableEventAddView(viewModel: viewModel.preferableEventAddViewModel, focused: focused, spaceController: spaceController)
                .background(
                    GeometryReader { proxy in
                        Color.clear.padding().onAppear(perform: {
                            spaceController.textFieldHeight = proxy.size.height
                        })
                    }
                )
                .offset(x: 0, y: -spaceController.space)
            Spacer().frame(height: spaceController.space)
            PreferableEventsListView(viewModel: viewModel.preferableEventsListViewModel, spaceController: spaceController, focused: focused)
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
