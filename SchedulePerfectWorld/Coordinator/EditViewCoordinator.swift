//
//  EditViewCoordinator.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 04.06.2024.
//

import SwiftUI
import Combine

final class EditViewCoordinator: ObservableObject, Hashable {

    private var id: UUID
    
    var viewModelFactory: ViewModelFactory
    
    init(viewModelFactory: ViewModelFactory) {
        self.id = UUID()
        self.viewModelFactory = viewModelFactory
    }
    
    @ViewBuilder func build() -> some View {
        EditView(viewModel: viewModelFactory.makeEditViewModel())
    }
    
    // MARK: Required methods for class to conform to Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: EditViewCoordinator, rhs: EditViewCoordinator) -> Bool {
        return lhs.id == rhs.id
    }
}
