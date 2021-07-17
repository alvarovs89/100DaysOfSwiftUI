//
//  ContentView6.swift
//  Drawing
//
//  Created by Alvaro Valdes Salazar on 26-08-20.
//  Copyright © 2020 Alvaro Valdes Salazar. All rights reserved.

//How to draw part of a solid shape using trim()

//SwiftUI lets us draw only part of a stroke or fill for a shape using its trim() modifier, which takes two parameters: a start value and an end value, both stored as a CGFloat between 0 and 1.

//SwiftUI draws its shapes so that 0 degrees is directly to the right, so if you want to change that so 0 degrees is directly up you should apply a rotationEffect() modifier.
//
//For example, this uses a timer to adjust the values being passed into trim() so that a circle’s stroke grows over time, like a progress indicator:
import SwiftUI

struct ContentView6: View {
    @State private var completionAmount: CGFloat = 0.0
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()

    var body: some View {
        Rectangle()
            .trim(from: 0, to: completionAmount)
            .stroke(Color.red, lineWidth: 20)
            .frame(width: 200, height: 200)
            .rotationEffect(.degrees(-90))
            .onReceive(timer) { _ in
                withAnimation {
                    guard self.completionAmount < 1 else { return }
                    self.completionAmount += 0.2
                }
            }
    }
}

struct ContentView6_Previews: PreviewProvider {
    static var previews: some View {
        ContentView6()
    }
}
