//
//  ProjectCardView.swift
//  VisionProTodoApp
//
//  Created by Jan Blazej on 14.02.2024.
//

import SwiftUI

struct ProjectCardView: View {
    var label: String
    var iconName: String
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: iconName)
                    .font(.system(size: 32))
                    .foregroundColor(.secondary)
                Spacer().frame(height: 16)
                Text(label)
                    .font(.title2)
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 24)
            .frame(width: 200, height: 200)
        }
        .contentShape(Rectangle())
        .hoverEffect()
        .glassBackgroundEffect(in: Rectangle())
    }
}

#Preview {
    ProjectCardView(label: "Project", iconName: "doc.plaintext")
}
