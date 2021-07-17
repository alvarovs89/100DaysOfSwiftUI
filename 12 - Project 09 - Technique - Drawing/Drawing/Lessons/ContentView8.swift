//
//  ContentView8.swift
//  Drawing
//
//  Created by Alvaro Valdes Salazar on 28-08-20.
//  Copyright © 2020 Alvaro Valdes Salazar. All rights reserved.
//

import SwiftUI

struct ContentView8: View {
    var body: some View {
//        ZStack {
//            Image("AlvaroValdes")
//            .resizable()
//            .scaledToFit()
//            Rectangle()
//                .fill(Color.red)
//                .blendMode(.multiply)
//        }
//        .frame(width: 700, height: 450)
//        .clipped()
// SAME RESULT AS
          Image("AlvaroValdes")
                    .resizable()
                    .scaledToFit()
            .colorMultiply(.red)
        
    }
}

struct ContentView8_Previews: PreviewProvider {
    static var previews: some View {
        ContentView8()
    }
}
