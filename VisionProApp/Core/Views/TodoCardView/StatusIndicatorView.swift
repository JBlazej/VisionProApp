//
//  StatusIndicatorView.swift
//  VisionProTodoApp
//
//  Created by Jan Blazej on 13.02.2024.
//

import SwiftUI

struct StatusIndicatorView: View {
    var status: Bool
    
    var body: some View {
        let backgroundColor: Color = {
            if status {
                return Color.green
            } else {
                return Color.orange
            }
        }()
        
        Text(status ? "Completed" : "Pending")
            .font(.footnote)
            .foregroundColor(.white)
            .padding(Spacing.s8)
            .background(backgroundColor)
            .clipShape(Capsule())
    }
}

#Preview {
    StatusIndicatorView(status: false)
}
