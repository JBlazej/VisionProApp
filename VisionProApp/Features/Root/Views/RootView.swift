//
//  RootView.swift
//  VisionProTodoApp
//
//  Created by Jan Blazej on 13.02.2024.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        ZStack {
            NavigationStack {
                RootNavigationView()
            }
        }
    }
}

#Preview {
    RootView()
}
