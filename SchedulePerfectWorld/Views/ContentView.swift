//
//  ContentView.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 17.05.2024.
//

import SwiftUI
import Combine

struct ContentView: View {

    @ObservedObject var scheduleViewCoordinator: ScheduleViewCoordinator
    
    var body: some View {
        NavigationStack(path: $scheduleViewCoordinator.router.path) {
            ZStack {
                Color.element
                    .ignoresSafeArea()
                scheduleViewCoordinator.build()
                    .navigationDestination(for: EditViewCoordinator.self) { coordinator in
                        coordinator.build()
                    }
            }
            .preferredColorScheme(scheduleViewCoordinator.appColorScheme)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(scheduleViewCoordinator: ScheduleViewCoordinator(router: NavigationRouter(path: NavigationPath()), 
                                                                     viewModelFactory: ViewModelFactory()))
    }
}
