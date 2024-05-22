//
//  DatePickerView.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 17.05.2024.
//

import SwiftUI

struct DatePickerView: View {
    
    var title: String
    @Binding var time: Date
    
    var body: some View {
        Text(title)
        DatePicker("", selection: $time, displayedComponents: .hourAndMinute)
            .labelsHidden()
    }
}

struct DatePickerView_Previews : PreviewProvider {
    @State static var date1 = Date(timeIntervalSince1970: 0)
    static var previews: some View {
        DatePickerView(title: "Начало: ", time: $date1)
    }
}
