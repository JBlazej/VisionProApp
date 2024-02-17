//
//  WindowView.swift
//  VisionProApp
//
//  Created by Jan Blazej on 17.02.2024.
//

import SwiftUI
import SwiftData

struct WindowView: View {
    @Environment(ViewModel.self) private var model
    @Environment(\.dismissWindow) private var dismissWindow
    
    @Query private var todos: [Todo]
    var todo: Todo? { todos.first }

    
    init(id: String) {
        let predicate = #Predicate<Todo> { todo in
            todo.id == id
        }
        
        _todos = Query(filter: predicate)
    }
    
    var body: some View {
        VStack {
            if let todo {
                TodoCardView(todo: todo, isWindow: true)
            } else {
                Text("Todo nil")
            }
            Button("Close") {
                model.selectedTodoId = ""
                model.isShowingWindow = false
                dismissWindow(id: model.windowId)
            }
            .padding(12)
        }
        .onDisappear {
            model.isShowingWindow = false
        }
    }
}
