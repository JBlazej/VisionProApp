//
//  CreateTodoBottomSheet.swift
//  VisionProTodoApp
//
//  Created by Jan Blazej on 13.02.2024.
//

import SwiftUI

struct CreateTodoBottomSheet: View {
    @Environment(\.dismiss) var dismiss
    
    @State var titleInput = ""
    @State var descriptionInput = ""
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack{
                Text("Create new TODO")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            .padding()

            VStack {
                title
                description
            }
            .padding()
            
            HStack (alignment: .center) {
                Spacer()
                VStack {
                    Button("Create") {}
                    Button("Dismiss") {
                        dismiss()
                    }
                    .buttonStyle(.borderless)
                }
                .padding(.vertical, Spacing.s22)
                Spacer()
            }
        }
        .padding()
        .frame(minWidth: 440)
    }
}

private extension CreateTodoBottomSheet {
    var title: some View {
        TextField("Title", text: $titleInput)
    }
    
    var description: some View {
        TextField("Description", text: $descriptionInput)
    }
}

#Preview {
    CreateTodoBottomSheet()
}
