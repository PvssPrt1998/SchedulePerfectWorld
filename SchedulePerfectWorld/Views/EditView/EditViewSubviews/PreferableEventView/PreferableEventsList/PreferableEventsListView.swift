//
//  PreferableEventsListView.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 11.06.2024.
//

import SwiftUI

struct PreferableEventsListView: View {
    
    @ObservedObject var viewModel: PreferableEventsListViewModel
    @ObservedObject var spaceController: SpaceController
    
    var body: some View {
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
                .gesture(
                    DragGesture(minimumDistance: 10.0, coordinateSpace: .local)
                        .onEnded({ value in
                            if value.translation.height < 0 {
                                withAnimation(.linear(duration: 0.1)) {
                                    spaceController.space = 100
                                    spaceController.offset = spaceController.getTotalOffset()
                                }
                            }
                            
                            if value.translation.height > 0 {
                                withAnimation(.linear(duration: 0.1)) {
                                    spaceController.space = 0
                                    spaceController.offset = 0
                                }
                            }
                        })
                )
            }
            .scrollBounceBehavior(.basedOnSize)
        }
    }
}

#Preview {
    PreferableEventsListView(viewModel: PreferableEventsListViewModel(scheduleController: ScheduleController()), spaceController: SpaceController())
}
