//
//  HomeView.swift
//  VisionProTodoApp
//
//  Created by Jan Blazej on 13.02.2024.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Query private var todos: [Todo]
    @State private var isBottomSheetOpen = false
    
    var body: some View {
        ScrollView {
            if todos.isEmpty {
                VStack {
                    ContentUnavailableView {
                        Label("No pending Todos", systemImage: "doc.plaintext")
                    } description: {
                        Text("Add new todo and will appear here..")
                        Button("Add todo") {
                            isBottomSheetOpen.toggle()
                        }
                    }
                    .padding()
                }
            } else {
                LazyVGrid(columns: [GridItem()], alignment: .center) {
                    VStack (alignment: .leading, spacing: Spacing.s16) {
                        ForEach(todos) { todo in
                            TodoCardView(todo: todo)
                        }
                    }
                    .frame(minWidth: 0, maxWidth: 600)
                }
                .padding(.top, Spacing.s16)
                .padding(.bottom, Spacing.s16)
                .frame(minWidth: 0, maxWidth: .infinity)
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .topBarLeading) {
                HStack(alignment: .center) {
                    Text("Todos")
                        .font(.largeTitle)
                    if !todos.isEmpty {
                        Text("(" + String(todos.count) + ")")
                            .foregroundStyle(.tertiary)
                            .font(.title)
                    }
                }
            }
            ToolbarItem {
                if !todos.isEmpty {
                    Button(action: {
                        isBottomSheetOpen.toggle()
                    }, label: {
                        Image(systemName: "plus").frame(width: 3, height: 3)
                    })
                }
            }
        }
        .sheet(isPresented: $isBottomSheetOpen) {
            CreateTodoView()
        }
    }
}
