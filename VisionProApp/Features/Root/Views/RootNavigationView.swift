//
//  RootNavigationView.swift
//  VisionProTodoApp
//
//  Created by Jan Blazej on 13.02.2024.
//

import SwiftUI

struct RootNavigationView: View {
    var body: some View {
        VStack (alignment: .center) {
            VStack(alignment: .center) {
                title
                HStack {
                    ForEach(AppScreen.allCases) { screen in
                        NavigationLink {
                            screen.destination
                        } label: {
                            ProjectCardView(label: screen.label, iconName: screen.iconName)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
        .background(backgroundImage)
    }
}

private extension RootNavigationView {
    var title: some View {
        HStack(alignment: .center) {
            Text("Exploring - ")
                .font(.extraLargeTitle)
                .textCase(.uppercase)
                .foregroundColor(.primary.opacity(0))
                .frame(width: 300, height: 100)
                .overlay(
                    Rectangle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [.yellow, .red, .blue, .indigo]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .mask(
                            Text("Exploring - ")
                                .font(.extraLargeTitle)
                                .textCase(.uppercase)
                                .frame(width: 300, height: 100)
                        )
                )
            
            Text("Vision Pro App")
                .font(.extraLargeTitle2)
        }
        .padding(.top, Spacing.s24)
    }
    
    var backgroundImage: some View {
        Image("space2")
            .aspectRatio(contentMode: .fill)
            .scaledToFill()
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    NavigationStack {
        RootNavigationView()
    }
}
