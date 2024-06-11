//
//  PreferableEventView.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 17.05.2024.
//

import SwiftUI

struct PreferableEventView: View {

    var viewModel: PreferableEventViewModel
    
    var body: some View {
        VStack {
            PreferableEventAddView(viewModel: viewModel.preferableEventAddViewModel)
            PreferableEventsListView(viewModel: viewModel.preferableEventsListViewModel)
        }
    }
}

#Preview {
    PreferableEventView(viewModel: PreferableEventViewModel(scheduleController: ScheduleController()))
}
