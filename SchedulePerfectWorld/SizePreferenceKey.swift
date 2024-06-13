//
//  SizePreferenceKey.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 13.06.2024.
//

import SwiftUI

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}

public extension View {
    func getHeight(height: Binding<CGFloat>) -> some View {
        background {
            GeometryReader { reader in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: reader.size.height)
            }
        }.onPreferenceChange(SizePreferenceKey.self) { newSize in
            height.wrappedValue = newSize
        }
    }
}
