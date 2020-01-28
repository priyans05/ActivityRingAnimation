//
//  ActivityModel.swift
//  ActivityRingAnimation
//
//  Created by PRIYANS on 29/1/20.
//  Copyright © 2020 PRIYANS. All rights reserved.
//

import Foundation
import CoreGraphics
import SwiftUI


struct Activity: Identifiable {
    
    var id = UUID()
    var activityName: String
    var activityUnit: Double
    var percentage: CGFloat {
        switch activityName {
        case "Excercise":
            return (CGFloat((activityUnit) / 30))
        case "Calories Burned":
            return (CGFloat((activityUnit) / 500))
        case "Standing Hours":
            return (CGFloat((activityUnit) / 12))
        default:
            return 0.0
        }
    }
    
    var thrashHold: Int {
        switch activityName {
        case "Excercise":
            return 30
        case "Calories Burned":
            return 500
        case "Standing Hours":
            return 12
        default:
            return 0
        }
    }
    
    var activityUnitDescription: String {
        switch activityName {
        case "Excercise":
            return "Mins"
        case "Calories Burned":
            return "Calories"
        case "Standing Hours":
            return "hours"
        default:
            return ""
        }
    }
    
    var ringColor: Color {
        switch activityName {
        case "Excercise":
            return Color.red
        case "Calories Burned":
            return Color.green
        case "Standing Hours":
            return Color.blue
        default:
            return Color.clear
        }
    }
}




