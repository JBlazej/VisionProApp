//
//  TodoView.swift
//  VisionProTodoApp
//
//  Created by Jan Blazej on 13.02.2024.
//

import SwiftUI
import SwiftData

struct TodoCardView: View {
    @Environment(ViewModel.self) private var model
    @Environment(\.modelContext) var ctx
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    @Bindable var todo: Todo
    
    @State private var isOpenBottomsheet: Bool = false
    
    var isWindow: Bool = false
    
    var body: some View {
        @Bindable var model = model
        
        VStack (alignment: .leading) {
            HStack (alignment: .top) {
                if !todo.isCompleted {
                    if !isWindow {
                        VStack {
                            Spacer()
                            Toggle("Hidden", isOn: $todo.isCompleted)
                                .toggleStyle(.switch)
                                .labelsHidden()
                            Spacer()
                        }
                    }
                }
                VStack (alignment: .leading) {
                    Text(todo.title)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                    StatusIndicatorView(isCompleted: todo.isCompleted)
                        .padding(.bottom, Spacing.s4)
                    if let note = todo.note {
                        Text(note)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.leading)
                    }
                    if !isWindow {
                        HStack {
                            Button("Delete TODO") {
                                ctx.delete(todo)
                            }
                            
                            if !todo.isCompleted {
                                Button("Update TODO") {
                                    isOpenBottomsheet.toggle()
                                }
                            }
                        }
                        
                        Button(model.selectedTodoId == todo.id ? "Hide" : "Show me - \(todo.id)") {
                            if(model.selectedTodoId == todo.id) {
                                model.selectedTodoId = ""
                                model.isShowingWindow = false
                                dismissWindow(id: model.windowId)
                                return
                            }
                            
                            model.selectedTodoId = todo.id
                            guard !model.isShowingWindow else { return }
                            model.isShowingWindow = true
                            openWindow(id: model.windowId)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, Spacing.s24)
                .padding(.horizontal, Spacing.s16)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .glassBackgroundEffect(in: RoundedRectangle(cornerRadius: Radii.r16))
        .sheet(isPresented: $isOpenBottomsheet) {
            UpdateTodoView(item: todo)
        }
    }
}
