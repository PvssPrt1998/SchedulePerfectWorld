//
//  ListWithTextFieldContext.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 12.06.2024.
//

import SwiftUI

protocol ListWithTextFieldContext: AnyObject {
    var addTextFieldOffset: CGFloat { get set }
    var addTextFieldHeight: CGFloat { get set }
    
    var elementsAboveAddTextFieldHeight: CGFloat { get set }
    var moveUpOffset: CGFloat { get set }
    var spacingUnderAddTextField: CGFloat { get set }
    
    var underListViewBottomSpacing: CGFloat { get set }
    
    var screenHeight: CGFloat { get set }
    var safeAreaTop: CGFloat { get set }
    
    var listScrollDisabled: Bool { get set }
    
    func listWithTextFieldStateTransition(to state: ListWithTextFieldState)
}

