//
//  ScheduleRowView.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 17.05.2024.
//

import SwiftUI

struct ScheduleRow: View {
    
    var scheduleItem: ScheduleItem
    
    var body: some View {
        HStack {
            if scheduleItem.imageTitle != nil {
                Image(scheduleItem.imageTitle!)
                    .resizable()
                    .frame(width: 32, height: 32)
            }
            Text(scheduleItem.description)
            Spacer()
        }
    }
}

#Preview {
    ScheduleRow(scheduleItem: ScheduleItem(description: "description"))
}
