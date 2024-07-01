//
//  TextFieldWithBorderView.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 19.05.2024.
//

import SwiftUI

struct TextFieldWithBorderView: View {
    
    var binding: Binding<String>
    var focused: FocusState<EditView.Field?>.Binding
    var field: EditView.Field?
    var borderColor: Color?
    
    var body: some View {
        TextField("", text: binding, axis: .vertical)
            .lineLimit(1...3)
            .focused(focused, equals: field)
            .tint(.gray)
            .padding(.horizontal, 9)
            .padding(.vertical, 8)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(borderColor ?? Color.element)
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
    @FocusState static var focused: EditView.Field?
    @State static var text = ""
    static var previews: some View {
        TextFieldWithBorderView(binding: $text, focused: $focused, field: .greetingField)
    }
}

