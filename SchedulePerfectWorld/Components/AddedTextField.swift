//
//  AddedTextField.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 20.05.2024.
//

import SwiftUI

struct AddedText: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .padding(.horizontal, 9)
            .padding(.vertical, 8)
    }
}

#Preview {
    AddedText(text: "Sex")
}
