//
//  Extensions.swift
//  VisionProApp
//
//  Created by Jan Blazej on 14.02.2024.
//

import Foundation
import SwiftUI

extension Binding {
    func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}
