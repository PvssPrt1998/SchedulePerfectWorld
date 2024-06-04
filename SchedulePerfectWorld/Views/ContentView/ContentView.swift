//
//  ContentView.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 17.05.2024.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    @StateObject var scheduleViewCoordinator = ScheduleViewCoordinator(path: NavigationPath())
    
    var body: some View {
        
        NavigationStack(path: $scheduleViewCoordinator.path) {
            ZStack {
                Color.element
                    .ignoresSafeArea()
                scheduleViewCoordinator.build()
                    .navigationDestination(for: EditFlowCoordinator.self) { coordinator in
                        coordinator.build()
                    }
            }
        }
        //.environmentObject(scheduleViewCoordinator)
        .environmentObject(viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
