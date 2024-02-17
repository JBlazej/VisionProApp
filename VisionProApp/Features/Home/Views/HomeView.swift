//
//  HomeView.swift
//  VisionProTodoApp
//
//  Created by Jan Blazej on 13.02.2024.
//

import SwiftUI
import SwiftData

struct SectionTitleView: View {
    var title: String
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                HStack {
                    Text(title)
                        .font(.title)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(width: 600, alignment: .leading)
        }
        .frame(maxWidth: .infinity)
    }
}

struct PendingTodosView: View {
    @Query(
        filter: #Predicate<Todo> { $0.isCompleted == false },
        sort: \.timestamp
    ) private var pendingTodos: [Todo]
    
    var body: some View {
        LazyVGrid(columns: [GridItem()], alignment: .center) {
            VStack (alignment: .leading, spacing: Spacing.s16) {
                ForEach(pendingTodos) { todo in
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

struct CompletedTodosView: View {
    @Query(
        filter: #Predicate<Todo> { $0.isCompleted == true }
    ) private var completedTodos: [Todo]
    
    var body: some View {
        if !completedTodos.isEmpty {
            LazyVGrid(columns: [GridItem()], alignment: .center) {
                VStack (alignment: .leading, spacing: Spacing.s16) {
                    ForEach(completedTodos) { todo in
                        TodoCardView(todo: todo)
                    }
                }
                .frame(minWidth: 0, maxWidth: 600)
            }
            .padding(.bottom, Spacing.s80)
        }
    }
}

struct HomeView: View {
    @Query(
        filter: #Predicate<Todo> { $0.isCompleted == false },
        sort: \.timestamp
    ) private var pendingTodos: [Todo]
    
    @State private var isBottomSheetOpen = false
    
    var body: some View {
        ScrollView {
            if pendingTodos.isEmpty {
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
                SectionTitleView(title: "Pending")
                PendingTodosView()
            }
            SectionTitleView(title: "Completed")
            CompletedTodosView()
        }
        .toolbar {
            ToolbarItemGroup(placement: .topBarLeading) {
                HStack(alignment: .center) {
                    Text("Todos")
                        .font(.largeTitle)
                    if !pendingTodos.isEmpty {
                        Text("(" + String(pendingTodos.count) + ")")
                            .foregroundStyle(.tertiary)
                            .font(.title)
                    }
                }
            }
            ToolbarItem {
                if !pendingTodos.isEmpty {
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
