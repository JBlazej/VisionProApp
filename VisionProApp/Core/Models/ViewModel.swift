//
//  ViewModel.swift
//  VisionProApp
//
//  Created by Jan Blazej on 14.02.2024.
//

import Foundation

@Observable
class ViewModel
{
    var isShowingWindow : Bool = false
    
    var windowId: String = "WindowArea"
    var selectedTodoId: String = ""
}

