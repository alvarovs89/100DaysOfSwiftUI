//
//  ContentView.swift
//  Drawing
//
//  Created by Alvaro Valdes Salazar on 26-08-20.
//  Copyright © 2020 Alvaro Valdes Salazar. All rights reserved.


// https://en.wikipedia.org/wiki/Hypotrochoid

import SwiftUI
//Our algorithm has four inputs:
//
//The radius of the inner circle.
//The radius of the outer circle.
//The distance of the virtual pen from the center of the outer circle.
//What amount of the roulette to draw. This is optional, but I think it really helps show what’s happening as the algorithm works.
//So, let’s start with that:

struct Spirograph: Shape {
    let innerRadius: Int
    let outerRadius: Int
    let distance: Int
    let amount: CGFloat
    
    
//    We then prepare three values from that data, starting with the greatest common divisor (GCD) of the inner radius and outer radius. Calculating the GCD of two numbers is usually done with Euclid's algorithm, which in a slightly simplified form looks like this:
    func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b

        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }

        return a
    }
    
//    The other two values are the difference between the inner radius and outer radius, and how many steps we need to perform to draw the roulette – this is 360 degrees multiplied by the outer radius divided by the greatest common divisor, multiplied by our amount input. All our inputs work best when provided as integers, but when it comes to drawing the roulette we need to use CGFloat, so we’re also going to create CGFloat copies of our inputs.

//    Add this path(in:) method to the Spirograph struct now:
    func path(in rect: CGRect) -> Path {
        let divisor = gcd(innerRadius, outerRadius)
        let outerRadius = CGFloat(self.outerRadius)
        let innerRadius = CGFloat(self.innerRadius)
        let distance = CGFloat(self.distance)
        let difference = innerRadius - outerRadius
        let endPoint = ceil(2 * CGFloat.pi * outerRadius / CGFloat(divisor)) * amount

        // more code to come
        var path = Path()

        for theta in stride(from: 0, through: endPoint, by: 0.01) {
            var x = difference * cos(theta) + distance * cos(difference / outerRadius * theta)
            var y = difference * sin(theta) - distance * sin(difference / outerRadius * theta)

            x += rect.width / 2
            y += rect.height / 2

            if theta == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }

        return path
        
        
    }

    
}
struct ContentView: View {
    @State private var innerRadius = 125.0
    @State private var outerRadius = 75.0
    @State private var distance = 25.0
    @State private var amount: CGFloat = 1.0
    @State private var hue = 0.6

    var body: some View {
        VStack(spacing: 0) {
            Spacer()

            Spirograph(innerRadius: Int(innerRadius), outerRadius: Int(outerRadius), distance: Int(distance), amount: amount)
                .stroke(Color(hue: hue, saturation: 1, brightness: 1), lineWidth: 1)
                .frame(width: 300, height: 300)

            Spacer()

            Group {
                Text("Inner radius: \(Int(innerRadius))")
                Slider(value: $innerRadius, in: 10...150, step: 1)
                    .padding([.horizontal, .bottom])

                Text("Outer radius: \(Int(outerRadius))")
                Slider(value: $outerRadius, in: 10...150, step: 1)
                    .padding([.horizontal, .bottom])

                Text("Distance: \(Int(distance))")
                Slider(value: $distance, in: 1...150, step: 1)
                    .padding([.horizontal, .bottom])

                Text("Amount: \(amount, specifier: "%.2f")")
                Slider(value: $amount)
                    .padding([.horizontal, .bottom])

                Text("Color")
                Slider(value: $hue)
                    .padding(.horizontal)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
