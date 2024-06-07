//
//  PlusButton.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 17.05.2024.
//

import SwiftUI

struct PlusButton: View {
    
    var buttonTintColor: Color
    
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "plus")
                .scaledToFit()
                .foregroundStyle(buttonTintColor)
                .frame(width: 16, height: 16)
                .padding()
        }
    }
}

#Preview {
    PlusButton(buttonTintColor: .gray, action: {})
}
