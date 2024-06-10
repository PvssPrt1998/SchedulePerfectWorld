//
//  TextFieldWithBorderView.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 19.05.2024.
//

import SwiftUI

struct TextFieldWithBorderView: View {
    
    var binding: Binding<String>
    @FocusState var focused: Bool
    var borderColor: Color?
    
    var body: some View {
        TextField("", text: binding, axis: .vertical)
            .lineLimit(1...3)
            .focused($focused)
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
            .toolbar {
                if focused {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            focused = false
                        }
                    }
                }
            }
    }
}

struct TextFieldWithBorder_Preview : PreviewProvider {
    @State static var text = ""
    static var previews: some View {
        TextFieldWithBorderView(binding: $text)
    }
}

