//
//  VisionProTodoAppApp.swift
//  VisionProTodoApp
//
//  Created by Jan Blazej on 13.02.2024.
//

import SwiftUI

@main
struct VisionProApp: App {
    @State private var model = ViewModel()
    
    var body: some Scene {
        WindowGroup ("Root", id: "Root") {
            RootView()
                .environment(model)
                .modelContainer(for: Todo.self)
        }
        
        WindowGroup(id: model.windowId) {
            WindowView(id: model.selectedTodoId)
                .environment(model)
                .modelContainer(for: Todo.self)
        }
        .windowStyle(.plain)
        .defaultSize(width: 0.5, height: 0.3, depth: 0.01, in: .meters)
    }
}
