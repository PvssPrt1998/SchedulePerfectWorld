//
//  SpaceController.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 12.06.2024.
//

import SwiftUI

final class SpaceController: ObservableObject, ListStateContext, ListWithTextFieldContext {
    
    @Published var moveUpOffset: CGFloat = 0
    var elementsAboveAddTextFieldHeight: CGFloat = 0
    var addTextFieldHeight: CGFloat = 0 {
        didSet {
            if isListWithTextFieldLargeState() {
                moveUpOffset = moveUpOffset + oldValue - addTextFieldHeight
                underListViewBottomSpacing = addTextFieldHeight
            }
        }
    }
    var safeAreaTop: CGFloat = 0
    var spacingUnderAddTextField: CGFloat = 0
    var listScrollDisabled: Bool = true
    
    @Published var addTextFieldOffset: CGFloat = 0
    var screenHeight: CGFloat = 0
    
    var textFieldOffset: CGFloat = 0
    var underListViewBottomSpacing: CGFloat = 0
    
    var safeAreaTopHeight: CGFloat = 0
    var safeAreaBottomHeight: CGFloat = 0
    
    @Published var listState: ListState
    @Published var listWithTextFieldState: ListWithTextFieldState
    
    init() {
        listState = ListNormalState()
        listWithTextFieldState = ListWithTextFieldNormalState()
        listState.update(context: self)
        listWithTextFieldState.update(context: self)
    }
    
    func listStateTransition(to state: ListState) {
        self.listState = state
        self.listState.update(context: self)
    }
    
    func listWithTextFieldStateTransition(to state: ListWithTextFieldState) {
        self.listWithTextFieldState = state
        self.listWithTextFieldState.update(context: self)
    }
    
    func dragGestureAction(value: DragGesture.Value) {
        if isListWithTextFieldNormalState() {
            if value.translation.height < 0 {
                if listState is ListNormalState {
                    listToLargeState()
                }
            }
            
            if value.translation.height > 0 {
                if isListLargeState() {
                    listToNormalState()
                }
            }
        }
    }
    
    func listToNormalState() {
        withAnimation(.linear(duration: 0.1)) {
            listState.toNormal()
        }
    }
    
    func listToLargeState() {
        withAnimation(.linear(duration: 0.1)) {
            listState.toLarge()
        }
    }
    
    func listWithTextFieldToNormalState() {
        withAnimation(.linear(duration: 0.1)) {
            listWithTextFieldState.toNormal()
        }
    }
    
    func listWithTextFieldToLargeState() {
        withAnimation(.linear(duration: 0.1)) {
            listWithTextFieldState.toLarge()
        }
    }
    
    func isListLargeState() -> Bool {
        listState is ListLargeState
    }
    
    func isListNormalState() -> Bool {
        listState is ListNormalState
    }
    
    func isListWithTextFieldNormalState() -> Bool {
        listWithTextFieldState is ListWithTextFieldNormalState
    }
    
    func isListWithTextFieldLargeState() -> Bool {
        listWithTextFieldState is ListWithTextFieldLargeState
    }
    
    func downButtonPressed() {
        listToNormalState()
    }
}
