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
    
    var viewModel: ScheduleViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading, spacing: 10) {
                ForEach(viewModel.scheduleItemArray, id: \.self) { item in
                    ScheduleRow(scheduleItem: item)
                }
            }
            .padding()
            .background(Color.element)
            .clipShape(.rect(cornerRadius: 8))
            .northWestShadow()
            .padding(20)
        }
        .scrollBounceBehavior(.basedOnSize)
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
    ScheduleView(viewModel: ScheduleViewModel(scheduleController: ScheduleController()))
}
