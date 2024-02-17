//
//  Todo.swift
//  VisionProTodoApp
//
//  Created by Jan Blazej on 13.02.2024.
//

import Foundation
import SwiftData

enum TodoPriority: Codable {
    case low
    case medium
    case high
}

@Model
final class Todo {
    var id: String
    var title: String
    var priority: TodoPriority
    var timestamp: Date
    var isCompleted: Bool
    var note: String?
    
    init(id: String = "", title: String = "", priority: TodoPriority = TodoPriority.low, timestamp: Date = Date.now, isCompleted: Bool = false, note: String? = nil) {
        self.id = id
        self.title = title
        self.priority = priority
        self.timestamp = timestamp
        self.isCompleted = isCompleted
        self.note = note
    }
}
