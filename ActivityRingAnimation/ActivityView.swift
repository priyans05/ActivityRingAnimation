//
//  ActivityView.swift
//  ActivityRingAnimation
//
//  Created by PRIYANS on 29/1/20.
//  Copyright © 2020 PRIYANS. All rights reserved.
//

import SwiftUI

struct ActivityView: View {
    
    var body: some View {
        ZStack {
            ActivityRingView(areaRadiusForTheRing: 60, percentageOfActivityFinished: 0.08, ringColor: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
            
        }.padding()
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}


struct ActivityRingView: View {
    var areaRadiusForTheRing: CGFloat
    var percentageOfActivityFinished: CGFloat
    
    var ringColor: Color = .red
    var ringLineWidth: CGFloat = 30
    var animationDuration: Double = 1.0
    
    @State private var animateRing: Bool = false
    @State private var isOverlapping: Bool = false
    
    //It will hold upto 100% of activity
    var primaryPercentOfActivityFinished: CGFloat {
        self.percentageOfActivityFinished < 1.0 ? self.percentageOfActivityFinished : 1.0
    }
    //It will hold beyond 100% of activity
    var secondaryPercentOfActivityFinished: CGFloat {
        self.percentageOfActivityFinished < 1.0 ? 0.0 : self.percentageOfActivityFinished.truncatingRemainder(dividingBy: 1.0)
    }
    //It will animate upto 100%
    var primaryDuration: Double {
        Double(primaryPercentOfActivityFinished / percentageOfActivityFinished) * animationDuration
    }
    //It will animate for more than 100%
    var secondaryDuration: Double {
        Double(percentageOfActivityFinished) - primaryDuration
    }
    
    //    Overlapping ring for the view when it goes beyond 100%
    private struct OverlappingRingView: View {
        var areaRadiusForTheRing: CGFloat
        var animationDuration: Double
        var ringColor: Color = .red
        var ringLineWidth: CGFloat = 30
        var delayDuration: Double
        
        @State private var animateRing: Bool = false
        var body: some View {
            Circle()
                .trim(from: 0, to: self.animateRing ? 0.005 : 0)
                .stroke(ringColor, style: StrokeStyle(lineWidth: ringLineWidth, lineCap: .round))
                .frame(width: areaRadiusForTheRing, height: areaRadiusForTheRing)
                .rotationEffect(.degrees(-90.0))
                .shadow(color: Color.black, radius: 0, x: 2, y: 0)
                .animation(Animation.linear(duration: animationDuration).delay(delayDuration))
                .onAppear() {
                    self.animateRing.toggle()
                }
            
            
            
        }
    }
    //
    var body: some View {
        ZStack {
            Circle()
                .stroke(ringColor.opacity(0.3), style: StrokeStyle(lineWidth: ringLineWidth))
                .frame(width: areaRadiusForTheRing, height: areaRadiusForTheRing)
            
            Circle()
                .trim(from: 0, to: self.animateRing ? percentageOfActivityFinished : 0)
                .stroke(ringColor, style: StrokeStyle(lineWidth: ringLineWidth, lineCap: .round))
                .frame(width: areaRadiusForTheRing, height: areaRadiusForTheRing)
                .rotationEffect(.degrees(-90.0))
                .animation(.linear(duration: animationDuration))
                
                .onAppear() {
                    self.animateRing.toggle()
            }
           
            
            if percentageOfActivityFinished > 1.0 {
                OverlappingRingView(areaRadiusForTheRing: areaRadiusForTheRing, animationDuration: secondaryDuration, ringColor: ringColor, ringLineWidth: ringLineWidth, delayDuration: animationDuration)
                    .rotationEffect(.degrees(isOverlapping ? Double(self.secondaryPercentOfActivityFinished * 360) : 0))
                    .onAppear() {
                        self.isOverlapping.toggle()
                }
            }
        }
        .onTapGesture {
                       self.animateRing.toggle()
            
                   }
    }
    
}
