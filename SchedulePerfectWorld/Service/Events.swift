//
//  EventsEnum.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 20.05.2024.
//

import Foundation

class Events {
    let dynastyBattle: ScheduleItem = ScheduleItem(imageTitle: "DynastyCoin", description: "Битва династий 20:20 - 22:00")
    let godsFuck: ScheduleItem = ScheduleItem(description: "Ледяной штурм")
    let battleForResources: ScheduleItem = ScheduleItem(imageTitle: "BzrItem", description: "БЗР 20:00 - 21:30")
    let clanHallParty: ScheduleItem = ScheduleItem(description: "Танцы 19:30 - 20:00")
    let arenaCheck: ScheduleItem = ScheduleItem(description: "Зачет арены")
    
    let clanHallTask = ClanHall()
    let supplyWagon: ScheduleItem = ScheduleItem(description: "Повозка в СЗ: Круглосуточно")
    let everydayDungeon: ScheduleItem = EverydayDungeon().todaysDungeon()
}
