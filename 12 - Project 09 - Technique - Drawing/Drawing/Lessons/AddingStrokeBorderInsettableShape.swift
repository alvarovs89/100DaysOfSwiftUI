//
//  ContentView2.swift
//  Drawing
//
//  Created by Alvaro Valdes Salazar on 26-08-20.
//  Copyright © 2020 Alvaro Valdes Salazar. All rights reserved.
//


//Previously we built an Arc shape like this:


import SwiftUI

struct ContentView2: View {
    var body: some View {
        VStack {
            Circle()
                .stroke(Color.blue, lineWidth: 40)
//            .strokeBorder(Color.blue, lineWidth: 40)
//

            Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
            .strokeBorder(Color.blue, lineWidth: 40)
//  si Arc no pertenece al protocolo "InsettableShape", no podria funcionar el strokeborder
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
