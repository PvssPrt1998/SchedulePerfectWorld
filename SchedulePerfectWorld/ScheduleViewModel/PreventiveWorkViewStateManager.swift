//
//  PreventiveWorkViewModel.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 17.05.2024.
//

import SwiftUI

class PreventiveWorkViewStateManager {
    
    var isPreventiveWorkToday: Bool = false
    var beginTime: Date = Date(timeIntervalSince1970: 0)
    var endTime: Date = Date(timeIntervalSince1970: 0)
    var isAddButtonState = true
    
    func getPreventiveWorkScheduleItem() -> ScheduleItem {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        var beginStr = dateFormatter.string(from: beginTime)
        var endStr = dateFormatter.string(from: endTime)
        if beginStr.first! == "0" {
            beginStr.removeFirst()
        }
        if endStr.first! == "0" {
            endStr.removeFirst()
        }
        
        return ScheduleItem(description: "С \(beginStr) до \(endStr) мск будут недоступны все серверы")
    }
}
