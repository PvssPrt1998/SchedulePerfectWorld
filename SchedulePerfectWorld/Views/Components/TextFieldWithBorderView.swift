//
//  TextFieldWithBorderView.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 19.05.2024.
//

import SwiftUI

struct TextFieldWithBorderView: View {
    
    var binding: Binding<String>
    var submitAction: () -> Void
    
    var body: some View {
        TextField("", text: binding)
            .submitLabel(.done)
            .onSubmit(submitAction)
            .tint(.gray)
            .padding(.horizontal, 9)
            .padding(.vertical, 8)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.element)
                    .northWestShadow(radius: 3, offset: 1)
                    RoundedRectangle(cornerRadius: 8)
                        .inset(by: 3)
                        .fill(Color.element)
                        .southEastShadow(radius: 1, offset: 1)
                }
            )
    }
}

struct TextFieldWithBorder_Preview : PreviewProvider {
    @State static var text = ""
    static var previews: some View {
        TextFieldWithBorderView(binding: $text, submitAction: {})
    }
}

