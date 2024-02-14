//
//  TodoView.swift
//  VisionProTodoApp
//
//  Created by Jan Blazej on 13.02.2024.
//

import SwiftUI
import SwiftData

struct TodoCardView: View {
    @Bindable var todo: Todo
    @State private var isAnimated: Bool = false
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack (alignment: .top) {
                if !todo.status {
                    VStack {
                        Spacer()
                        Toggle("Hidden", isOn: Binding<Bool>(
                            get: {
                                return todo.status
                            },
                            set: { newValue in
                                if newValue {
                                    todo.status = newValue
                                } else {
                                    todo.status = newValue
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
                    StatusIndicatorView(status: todo.status)
                        .padding(.bottom, Spacing.s4)
                    if let note = todo.note {
                        Text(note)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.leading)
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
        .opacity(isAnimated ? 1.0 : 0.0)
        .animation(.easeIn(duration: 1).delay(0.5), value: isAnimated)
        .onAppear {
            isAnimated = true
        }
    }
}
