//
//  PreferableEventView.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 17.05.2024.
//

import SwiftUI

struct PreferableEventView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        Toggle("Особое событие", isOn: $viewModel.preferableEventsStateManager.isPreferableEventOn)
        if viewModel.preferableEventsStateManager.isPreferableEventOn {
            if viewModel.schedule.preferableEvents != nil {
                if !viewModel.schedule.preferableEvents!.isEmpty {
                    AddedPreferableEventView()
                }
            }
            AddPreferableEventView()
        }
    }
}

#Preview {
    PreferableEventView()
        .environmentObject(ViewModel())
}
