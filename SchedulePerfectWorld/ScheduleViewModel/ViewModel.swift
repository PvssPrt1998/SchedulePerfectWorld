//
//  ViewModel.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 17.05.2024.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var preferableEventsStateManager = PreferableEventsViewStateManager()
}
