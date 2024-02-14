//
//  VisionProTodoAppApp.swift
//  VisionProTodoApp
//
//  Created by Jan Blazej on 13.02.2024.
//

import SwiftUI

@main
struct VisionProApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .modelContainer(for: Todo.self)
        }
    }
}
