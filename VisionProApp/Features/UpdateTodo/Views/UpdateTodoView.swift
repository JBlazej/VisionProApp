//
//  UpdateTodoView.swift
//  VisionProTodoApp
//
//  Created by Jan Blazej on 13.02.2024.
//

import SwiftUI
import SwiftData

struct UpdateTodoView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var ctx
    
    @State private var isShown = false
    @Bindable var item: Todo
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack{
                Text("Update Todo")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            .padding(.top)
            .padding(.vertical)
            
            title
            note
            Spacer().frame(height: Spacing.s22)
            datePicker
            timePicker
            priorityPicker
            
            HStack (alignment: .center) {
                Spacer()
                VStack {
                    Button("Update") {
                        withAnimation {
                            ctx.insert(item)
                            dismiss()
                        }
                    }
                    Button("Dismiss") {
                        dismiss()
                    }
                    .buttonStyle(.borderless)
                }
                .padding(.vertical, Spacing.s22)
                Spacer()
            }
            .opacity(isShown ? 1 : 0)
        }
        .padding(.horizontal, Spacing.s16)
        .frame(minWidth: 440)
        .onAppear() {
            withAnimation(.linear(duration: 1.5)) {
                isShown.toggle()
            }
        }
    }
}

private extension UpdateTodoView {
    var title: some View {
        VStack (alignment: .leading) {
            Text("Title")
                .font(.title3)
                .foregroundStyle(.foreground)
            TextField("Specified name of your todo", text: $item.title)
                .textFieldStyle(.roundedBorder)
        }
    }
    
    var note: some View {
        VStack (alignment: .leading) {
            Text("Note")
                .font(.title3)
                .foregroundStyle(.foreground)
            TextEditor(text: $item.note.toUnwrapped(defaultValue: ""))
                .foregroundStyle(.primary)
                .cornerRadius(20.0)
                .textEditorStyle(.roundedBorder)
        }
        .frame(minHeight: 150)
    }
    
    var datePicker: some View {
        DatePicker(
            "Date",
            selection: $item.timestamp,
            displayedComponents: [.date]
        )
        .font(.title3)
        .foregroundStyle(.foreground)
    }
    
    var timePicker: some View {
        DatePicker(
            "Time",
            selection: $item.timestamp,
            displayedComponents: [.hourAndMinute]
        )
        .datePickerStyle(.graphical)
        .font(.title3)
        .foregroundStyle(.foreground)
        .padding(.trailing, -8)
    }
    
    var priorityPicker: some View {
        HStack {
            Text("Priority")
                .font(.title3)
                .foregroundStyle(.foreground)
            Spacer()
            Picker("Priority", selection: $item.priority) {
                ForEach([TodoPriority.low, TodoPriority.medium, TodoPriority.high], id: \.self) { priority in
                    Text(priorityDescription(for: priority))
                }
            }
            .textEditorStyle(.roundedBorder)
        }
    }
    
    func priorityDescription(for priority: TodoPriority) -> String {
            switch priority {
            case .low:
                return "Low"
            case .medium:
                return "Medium"
            case .high:
                return "High"
            }
        }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: false)
    let container = try! ModelContainer(for: Todo.self, configurations: config)
    
    return UpdateTodoView(item: Todo(title: "Todo", priority: TodoPriority.low, timestamp: Date.now, isCompleted: false, note: nil))
        .modelContainer(container)
}
