//
//  ActivityRowView.swift
//  ActivityRingAnimation
//
//  Created by PRIYANS on 29/1/20.
//  Copyright © 2020 PRIYANS. All rights reserved.
//

import SwiftUI

struct ActivityRowView: View {
    var activity: Activity
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width - 10, height: 90)
                .foregroundColor(activity.ringColor.opacity(0.3))
                .cornerRadius(10)
            HStack {
                
                VStack(alignment: .leading) {
                    Text("\(activity.activityName)")
                        .font(.headline)
                        .bold()
                    .underline()
                        .padding(.bottom, 10)
                        
                    
                    Text("\(Int(activity.activityUnit)) / \(activity.thrashHold) - \(activity.activityUnitDescription)")
                        .font(.callout)
                        
                    
                }.padding()
                Spacer()
                ActivityRingView(areaRadiusForTheRing: 50, percentageOfActivityFinished: activity.percentage, ringColor: activity.ringColor, ringLineWidth: 12)
                .padding()
                    
            }.padding()
        }
    }
}

struct ActivityRowView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityRowView(activity: Activity(activityName: "Excercise", activityUnit: 20.0))
    }
}
