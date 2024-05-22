//
//  ContentView.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 17.05.2024.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.element
                    .ignoresSafeArea()
                ScheduleView()
            }
            .toolbar {
                NavigationLink {
                    EditView()
                } label: {
                    Text("Edit")
                }
            }
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    ContentView()
        .environmentObject(ViewModel())
}
