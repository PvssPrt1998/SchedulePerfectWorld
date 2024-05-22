//
//  AddPreferableEventRowView.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 17.05.2024.
//

import SwiftUI

struct AddedPreferableEventRowView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var preferableEvent: ScheduleItem
    
    var body: some View {
        HStack {
            AddedText(text: preferableEvent.description)
            Spacer()
            MinusButton {
                viewModel.schedule.preferableEvents!.removeAll(where: { $0 == preferableEvent })
            }
        }
    }
}

#Preview {
    AddedPreferableEventRowView(preferableEvent: ScheduleItem(description: "description"))
        .environmentObject(ViewModel())
}
