//
//  AddedPreferableEventView.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 17.05.2024.
//

import SwiftUI

struct AddedPreferableEventView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
//            ForEach(viewModel.schedule.preferableEvents!, id: \.self) { item in
//                AddedPreferableEventRowView(preferableEvent: item)
//            }
        }
    }
}

#Preview {
    AddedPreferableEventView()
        .environmentObject(ViewModel())
}
