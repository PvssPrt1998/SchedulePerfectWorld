//
//  DynastyBattleEvent.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 19.05.2024.
//

import Foundation

class ClanHall {
    
    enum ClanHallScheduleType {
        case defaultType
        case floatType
    }
    
    var defaultTime: Array<String> = [
        "00:00",
        "13:00",
        "16:00",
        "18:30",
        "21:30",
        "23:00"
    ]
    
    var floatTime: String = "Плавающее расписание, читайте чаты телеграма или дискорда"
    
    func clanHallDescription(type: ClanHallScheduleType = .defaultType) -> ScheduleItem {
        switch type {
        case .defaultType: ScheduleItem(imageTitle: "ClanHallItem", description: "КХ: " + defaultTime.joined(separator: ", "))
        case .floatType: ScheduleItem(imageTitle: "ClanHallItem", description: floatTime)
        }
    }
}
