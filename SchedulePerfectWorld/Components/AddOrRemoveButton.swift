//
//  MinusButton.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 17.05.2024.
//

import SwiftUI

struct AddOrRemoveButton: View {
    
    @Binding var isAddButtonState: Bool
    var buttonTintColor: Color
    var buttonImageTitle: String {
        if isAddButtonState {
            "plus"
        } else {
            "minus"
        }
    }
    
    var addAction: () -> Void
    var removeAction: () -> Void
    
    var body: some View {
        Button {
            if isAddButtonState {
                addAction()
                isAddButtonState.toggle()
            } else {
                removeAction()
                isAddButtonState.toggle()
            }
        } label: {
            Image(systemName: buttonImageTitle)
                .scaledToFit()
                .foregroundStyle(buttonTintColor)
                .frame(width: 16, height: 16)
                .padding()
        }
    }
}

struct AddOrRemoveButton_Preview : PreviewProvider {
    @State static var isAddState = true
    static var previews: some View {
        AddOrRemoveButton(isAddButtonState: $isAddState, buttonTintColor: .gray, addAction: {}, removeAction: {})
    }
}
