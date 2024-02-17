//
//  TodoView.swift
//  VisionProTodoApp
//
//  Created by Jan Blazej on 13.02.2024.
//

import SwiftUI
import SwiftData

struct TodoCardView: View {
    @Environment(\.modelContext) var ctx
    @Bindable var todo: Todo
    @State private var isOpenBottomsheet: Bool = false
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack (alignment: .top) {
                if !todo.isCompleted {
                    VStack {
                        Spacer()
                        Toggle("Hidden", isOn: Binding<Bool>(
                            get: {
                                return todo.isCompleted
                            },
                            set: { newValue in
                                if newValue {
                                    todo.isCompleted = newValue
                                } else {
                                    todo.isCompleted = newValue
                                }
                            }
                        ))
                        .toggleStyle(.switch)
                        .labelsHidden()
                        Spacer()
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
                    HStack {
                        Button("Delete TODO") {
                            ctx.delete(todo)
                        }
                        Button("Update TODO") {
                            isOpenBottomsheet.toggle()
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
