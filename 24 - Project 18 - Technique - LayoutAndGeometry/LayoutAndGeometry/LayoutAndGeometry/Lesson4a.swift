//
//  Lesson4a.swift
//  LayoutAndGeometry
//
//  Created by Alvaro Valdes Salazar on 17-07-21.
//

import SwiftUI

struct Lesson4a: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .background(Color.red)
//            .position(x: 100, y: 100)

            .offset(x: 100, y: 100)
            .background(Color.red)
    }
}

struct Lesson4a_Previews: PreviewProvider {
    static var previews: some View {
        Lesson4a()
    }
}
