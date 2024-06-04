//
//  ScheduleView.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 19.05.2024.
//

import SwiftUI
import Combine

struct ScheduleView: View {
    
    let didClickEditButton = PassthroughSubject<Bool, Never>()
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ScheduleRow(scheduleItem: viewModel.schedule.greeting)
            if viewModel.schedule.preventiveWork != nil {
                ScheduleRow(scheduleItem: viewModel.schedule.preventiveWork!)
            }
            if viewModel.schedule.preferableEvents != nil {
                if !viewModel.schedule.preferableEvents!.isEmpty {
                    ForEach(viewModel.schedule.preferableEvents!, id: \.self) { item in
                        ScheduleRow(scheduleItem: item)
                    }
                }
            }
            
            if viewModel.schedule.everyweekEvents != nil {
                ForEach(viewModel.schedule.everyweekEvents!, id: \.self) { item in
                    ScheduleRow(scheduleItem: item)
                }
            }
            
            ForEach(viewModel.schedule.everydayEvents, id: \.self) { item in
                ScheduleRow(scheduleItem: item)
            }
        }
        .padding()
        .background(
            Color.element
        )
        .clipShape(.rect(cornerRadius: 8))
        .northWestShadow()
        .padding(15)
        .toolbar {
            Button {
                didClickEditButton.send(true)
            } label: {
                Text("Edit")
            }
        }
    }
}

#Preview {
    ScheduleView()
        .environmentObject(ViewModel())
}
