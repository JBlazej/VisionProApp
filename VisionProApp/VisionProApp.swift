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
                .modelContainer(for: Todo.self)
                .environment(model)
        }
    }
}
