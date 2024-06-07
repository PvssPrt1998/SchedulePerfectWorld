//
//  PreventiveWorkViewModel.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 05.06.2024.
//

import SwiftUI

final class PreventiveWorkViewModel: ObservableObject, PreventiveWorkViewContext {
    
    @Published var state: PreventiveWorkViewState
    var buttonImageTitle: String = AddOrRemoveButtonTitle.plus.rawValue
    var buttonTingColor: Color = .buttonIsActive
    
    var beginTime: Date = Date(timeIntervalSince1970: 0)
    var endTime: Date = Date(timeIntervalSince1970: 0)
    
    private var scheduleController: ScheduleController
    
    init(scheduleController: ScheduleController) {
        self.scheduleController = scheduleController
        if scheduleController.isPreventiveWorkNil() {
            state = PreventiveWorkAddedState()
            state.update(context: self)
            toNotAddedState()
        } else {
            state = PreventiveWorkNotAddedState()
            state.update(context: self)
            toAddedState()
        }
    }
    
    func buttonAction() {
        isAddedState() ? toNotAddedState() : toAddedState()
    }
    
    func getPreventiveWorkText() -> String {
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
        
        return "С \(beginStr) до \(endStr) мск будут недоступны все серверы"
    }
    
    func isAddedState() -> Bool {
        state is PreventiveWorkAddedState
    }
}

extension PreventiveWorkViewModel {
    func transition(to state: PreventiveWorkViewState) {
        self.state = state
        self.state.update(context: self)
    }
    
    func toAddedState() {
        print("toAddedState")
        state.toAddedState()
        scheduleController.setPreventiveWork(text: getPreventiveWorkText())
    }
    
    func toNotAddedState() {
        state.toNotAddedState()
        scheduleController.removePreventiveWork()
    }
}

