//
//  ContentView5.swift
//  Drawing
//
//  Created by Alvaro Valdes Salazar on 26-08-20.
//  Copyright © 2020 Alvaro Valdes Salazar. All rights reserved.
//

import SwiftUI

struct ContentView5: View {
    var body: some View {
        VStack {
            Rectangle()
            .fill(Color.red)
                .frame(width: 200, height: 200)
            
            Circle()
            .fill(Color.blue)
            .frame(width: 50, height: 50)
        }
        
    }
}

struct ContentView5_Previews: PreviewProvider {
    static var previews: some View {
        ContentView5()
    }
}
