//
//  SchedulePerfectWorldApp.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 17.05.2024.
//

import SwiftUI

@main
struct SchedulePerfectWorldApp: App {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            //ContentView(scheduleViewCoordinator: ScheduleViewCoordinator(path: NavigationPath()))
            ContentView()
                .environmentObject(viewModel)
                .preferredColorScheme(viewModel.colorSchemeStateManager.appearance.getColorScheme())
        }
    }
}
