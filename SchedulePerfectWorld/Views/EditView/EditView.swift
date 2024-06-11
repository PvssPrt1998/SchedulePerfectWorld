//
//  EditView1.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 04.06.2024.
//

import SwiftUI

struct EditView: View {

    enum Field: Hashable {
        case greetingField
        case preferableEventField
    }
//    
//    @State var largeState: Bool = false
//    @State var offset: CGFloat = 0
//    @State var heightOffset: CGFloat = 0
    
    @StateObject var spaceController = SpaceController()
    
    @FocusState var focusedField: Field?
    
    var viewModel: EditViewModel
    
    var body: some View {
        ZStack {
            Color.element
                .ignoresSafeArea()
            ScrollViewReader { scrollValue in
                ScrollView(.vertical) {
                    VStack(spacing: 16) {
                        VStack(spacing: 16) {
                            ColorSchemeView(viewModel: viewModel.colorSchemeViewModel)
                            Divider()
                            GreetingView(viewModel: viewModel.greetingEditViewModel, focused: $focusedField)
                            Divider()
                            PreventiveWorkView(viewModel: viewModel.preventiveWorkViewModel)
                            Divider()
                        }
                        .background(
                            GeometryReader {proxy in
                                Color.clear.padding().onAppear(perform: {
                                    spaceController.height = proxy.size.height
                                })
                            }
                        )
                        PreferableEventView(viewModel: viewModel.preferableEventViewModel, 
                                            focused: $focusedField,
                                            spaceController: spaceController)
                        Spacer()
                    }
                    .padding()
                }
                .content.offset(x: 0, y: spaceController.offset)
                .scrollDisabled(true)
            }
        }
        .onTapGesture {
            focusedField = nil
        }
    }
}

#Preview {
    EditView(viewModel: EditViewModel(scheduleController: ScheduleController(), colorSchemeController: ColorSchemeController()))
}

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
            withAnimation(.linear(duration: 0.1)) {
                self.space = 200
                self.offset = self.getTotalOffset()
            }
        }
        
        if value.translation.height > 0 {
            withAnimation(.linear(duration: 0.1)) {
                self.space = 0
                self.offset = 0
            }
        }
    }
}
