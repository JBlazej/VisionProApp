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
    var isShowingRocketCapsule : Bool = false
    var isShowingFullRocket : Bool = false
    var isShowingMixedRocket : Bool = false
    
    var capsuleRealityAreaId: String = "CapsuleRealityArea"
    var fullRocketRealityArea: String = "FullRocketRealityArea"
    var mixedRocketRealityArea: String = "MixedRocketRealityArea"
}

