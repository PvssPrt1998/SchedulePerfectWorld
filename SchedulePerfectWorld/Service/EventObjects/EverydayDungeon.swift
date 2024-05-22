//
//  EverydayDungeon.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 19.05.2024.
//

import Foundation

class EverydayDungeon {
    let list: RingedLinkedList
    
    init() {
        self.list = RingedLinkedList(rootNode: Node(scheduleItem: ScheduleItem(imageTitle: "Treasure", description: "Ежа: ЛА/ДР/ОР")))
        list.addNode(scheduleItem: ScheduleItem(imageTitle: "Armour", description: "Ежа: СЦ/ХХ/ТС"))
        list.addNode(scheduleItem: ScheduleItem(imageTitle: "Weapon", description: "Ежа: ПП/МИ/ГШ"))
    }
    
    func todaysDungeon() -> ScheduleItem {
        let daysPassed = DateCounter().daysPassedFromDefaultDay()
        let cranks = daysPassed % list.count
        return list.crankList(times: cranks).scheduleItem
    }
}
