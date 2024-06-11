//
//  PreferableEventContext.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 07.06.2024.
//

import SwiftUI

protocol PreferableEventContext: AnyObject {

    var text: String { get set }
    var isAddButtonDisabled: Bool { get set }
    var addButtonTintColor: Color { get set }
    var textFieldBorderColor: Color? { get set }
    var showErrorCaption: Bool { get set }
    var captionColor: Color? { get set }
    var captionText: String { get set }
    
    func transition(to state: PreferableEventAddViewState)
}
