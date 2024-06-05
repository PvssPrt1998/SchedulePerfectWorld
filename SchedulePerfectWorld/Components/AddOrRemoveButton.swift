//
//  AddOrRemoveButton1.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 05.06.2024.
//

import SwiftUI

struct AddOrRemoveButton: View {
    
    var imageTitle: String
    var imageTintColor: Color
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: imageTitle)
                .scaledToFit()
                .foregroundStyle(imageTintColor)
                .frame(width: 16, height: 16)
                .padding()
        }
    }
}

#Preview {
    AddOrRemoveButton(imageTitle: "plus", imageTintColor: .gray, action: {})
}
