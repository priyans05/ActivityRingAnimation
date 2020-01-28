//
//  ContentView.swift
//  ActivityRingAnimation
//
//  Created by PRIYANS on 28/1/20.
//  Copyright © 2020 PRIYANS. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    let exerciseActivity = Activity(activityName: "Excercise", activityUnit: 20.0)
    let caloriesBurned = Activity(activityName: "Calories Burned", activityUnit: 430.0)
    let standingHours = Activity(activityName: "Standing Hours", activityUnit: 4.0)
    
    
    var body: some View {
        let activities: [Activity] = [exerciseActivity, caloriesBurned, standingHours]
        
        return VStack {
            ZStack {
                ActivityRingView(areaRadiusForTheRing: 60, percentageOfActivityFinished: standingHours.percentage, ringColor: standingHours.ringColor)
                ActivityRingView(areaRadiusForTheRing: 130, percentageOfActivityFinished: caloriesBurned.percentage, ringColor: caloriesBurned.ringColor)
                ActivityRingView(areaRadiusForTheRing: 200, percentageOfActivityFinished: exerciseActivity.percentage, ringColor: exerciseActivity.ringColor)
            }.padding()
            
            Text("Activity")
                .font(.largeTitle)
                .bold()
            
            Divider()
            
            List(activities) { activity in
                ActivityRowView(activity: activity)
            }
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
        
    }
}



