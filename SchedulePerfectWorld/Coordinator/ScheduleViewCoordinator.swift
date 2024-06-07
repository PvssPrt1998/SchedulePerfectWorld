//
//  ScheduleViewCoordinator.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 04.06.2024.
//

import SwiftUI
import Combine

final class ScheduleViewCoordinator: ObservableObject {
    
    var viewModelFactory: ViewModelFactory
    
    @Published var path: NavigationPath
    @Published var appColorScheme: ColorScheme?
    
    private var cancellables = Set<AnyCancellable>()
    
    init(path: NavigationPath, viewModelFactory: ViewModelFactory) {
        self.path = path
        self.viewModelFactory = viewModelFactory
        viewModelFactory.colorSchemeController.$colorScheme.sink { [weak self] colorScheme in
            self?.appColorScheme = colorScheme
        }
        .store(in: &cancellables)
    }
    
    private func push<T: Hashable>(_ coordinator: T) {
        path.append(coordinator)
    }
    
    @ViewBuilder func build() -> some View {
        scheduleView()
    }
    
    private func scheduleView() -> some View {
        let scheduleView = ScheduleView(viewModel: viewModelFactory.makeScheduleViewModel())
        bind(view: scheduleView)
        return scheduleView
    }
    
    
    private func bind(view: ScheduleView) {
        view.didClickEditButton
            .receive(on: DispatchQueue.main)
            .sink { [weak self] didClick in
                if didClick {
                    self?.makeEditViewCoordinator()
                }
            }
            .store(in: &cancellables)
    }
    
    private func makeEditViewCoordinator() {
        self.push(EditFlowCoordinator(viewModelFactory: viewModelFactory))
    }
}

