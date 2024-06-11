//
//  SpaceController.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 12.06.2024.
//

import SwiftUI

final class SpaceController: ObservableObject {
    @Published var offset: CGFloat = 0
    var height: CGFloat = 0
    var space: CGFloat = 0
    var textFieldHeight: CGFloat = 0
    
    func getTotalOffset() -> CGFloat {
        -height - textFieldHeight - space
    }
    
    func dragGestureAction(value: DragGesture.Value) {
        if value.translation.height < 0 {
            toLargeState()
        }
        
        if value.translation.height > 0 {
            toNormalState()
        }
    }
    
    func toNormalState() {
        withAnimation(.linear(duration: 0.1)) {
            self.space = 0
            self.offset = 0
        }
    }
    
    func toLargeState() {
        withAnimation(.linear(duration: 0.1)) {
            self.space = 200
            self.offset = self.getTotalOffset()
        }
    }
}
