//
//  CapsuleRealityView.swift
//  VisionProTodoApp
//
//  Created by Jan Blazej on 13.02.2024.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct CapsuleRealityView: View {
    @Environment(ViewModel.self) private var model
    
    @State private var capsule: Entity?
    
    var body: some View {
        RealityView { content in
            guard let entity = try? await Entity(named: "SceneRocket", in: realityKitContentBundle) else {
                fatalError("Unable to load scene model")
            }
            
            content.add(entity)
            // entity.scale = .init(repeating: 0.5)
            // entity.position = [0, 0.1, 0]
            self.capsule = entity
            self.capsule?.components.set(OrbitComponent(radius: 0.02, speed: 0, addOrientationRotation: true))
        } update: { content in
            print("RealityView changes detected...")
            
        } placeholder: {
            ProgressView()
                .progressViewStyle(.circular)
                .controlSize(.large)
        }
        .onDisappear {
            model.isShowingRocketCapsule = false
        }
    }
}

#Preview {
    CapsuleRealityView()
        .environment(ViewModel())
}
