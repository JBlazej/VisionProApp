//
//  ToggleWindow.swift
//  VisionProApp
//
//  Created by Jan Blazej on 17.02.2024.
//

import SwiftUI

struct ToggleWindow: View {
    @Binding var isShowing: Bool
    
    let toggleTitle: String
    let openCard: () async -> Void
    let dismissCard: () async -> Void
    
    var body: some View {
        VStack {
            Toggle(isShowing ? "Hide \(toggleTitle)" : "Show \(toggleTitle)", isOn: $isShowing)
                .onChange(of: isShowing, initial: false) { isShowing, initial in
                    Task {
                        if !isShowing {
                            await openCard()
                        } else {
                            await dismissCard()
                        }
                    }
                }
                .toggleStyle(.button)
                .padding(25)
        }
    }
}
