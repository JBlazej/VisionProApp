//
//  AppScreen.swift
//  VisionProTodoApp
//
//  Created by Jan Blazej on 13.02.2024.
//

import Foundation
import SwiftUI

enum AppScreen: CaseIterable, Identifiable {
    case home, models, space
    
    var id: String {
            switch self {
            case .home:
                return "home"
            case .models:
                return "models"
            case .space:
                return "space"
            }
        }
    
    var destination: some View {
        switch self {
        case .home:
            return AnyView(HomeView())
        case .models:
            return AnyView(ModelsView())
        case .space:
            return AnyView(SpaceView())
        }
    }
    
    var label: String {
        switch self {
        case .home:
            return "Todos"
        case .models:
            return "Models"
        case .space:
            return "Space"
        }
    }
    
    var iconName: String {
        switch self {
        case .home:
            return "doc.plaintext"
        case .models:
            return "rotate.3d.fill"
        case .space:
            return "hurricane.circle.fill"
        }
    }
}
