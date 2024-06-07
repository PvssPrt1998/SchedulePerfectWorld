//
//  MinusButton.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 20.05.2024.
//

import SwiftUI

struct MinusButton: View {
    
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "minus")
                .scaledToFit()
                .foregroundStyle(Color.buttonIsActive)
                .frame(width: 16, height: 16)
                .padding()
        }
    }
}

#Preview {
    MinusButton(action: {})
}
