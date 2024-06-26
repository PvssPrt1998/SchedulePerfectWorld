//
//  CaptionText.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 06.06.2024.
//

import Foundation

import SwiftUI

struct CaptionText: View {
    
    var text: String
    var color: Color?
    
    var body: some View {
        HStack {
            Text(text)
                .font(.caption)
                .lineLimit(1)
                .foregroundStyle(color ?? .gray)
            Spacer()
        }
    }
}

#Preview {
    CaptionText(text: "text")
}

