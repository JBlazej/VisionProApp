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
    var title: String
    var priority: TodoPriority
    var timestamp: Date
    var status: Bool
    var note: String?
    
    init(title: String = "", priority: TodoPriority = TodoPriority.low, timestamp: Date = Date.now, status: Bool = false, note: String? = nil) {
        self.title = title
        self.priority = priority
        self.timestamp = timestamp
        self.status = status
        self.note = note
    }
}
