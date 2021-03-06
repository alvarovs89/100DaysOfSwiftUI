//
//  ContentView8-2.swift
//  Drawing
//
//  Created by Alvaro Valdes Salazar on 28-08-20.
//  Copyright © 2020 Alvaro Valdes Salazar. All rights reserved.
//

import SwiftUI

struct ContentView8_2: View {
       @State private var amount: CGFloat = 0.0

        var body: some View {
            VStack {
                ZStack {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 200 * amount)
                        .offset(x: -50, y: -80)
                        .blendMode(.screen)

                    Circle()
                        .fill(Color.green)
                        .frame(width: 200 * amount)
                        .offset(x: 50, y: -80)
                        .blendMode(.screen)

                    Circle()
                        .fill(Color.blue)
                        .frame(width: 200 * amount)
                        .blendMode(.screen)
                }
                .frame(width: 300, height: 300)

                Slider(value: $amount)
                    .padding()
                
                
                Image("AlvaroValdes")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .saturation(Double(amount))
                .blur(radius: (1 - amount) * 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
        }
    }

struct ContentView8_2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView8_2()
    }
}
