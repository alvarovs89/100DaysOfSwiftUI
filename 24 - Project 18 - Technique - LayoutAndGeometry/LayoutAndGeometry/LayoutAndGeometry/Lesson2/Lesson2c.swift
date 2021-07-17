//
//  Lesson2c.swift
//  LayoutAndGeometry
//
//  Created by Alvaro Valdes Salazar on 17-07-21.
//

import SwiftUI

struct Lesson2c: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello, world!")
                .alignmentGuide(.leading) { d in d[.trailing] }

            Text("This is a longer line of text")
        }
        .background(Color.red)
        .frame(width: 400, height: 400)
        .background(Color.blue)
    }
}

struct Lesson2c_Previews: PreviewProvider {
    static var previews: some View {
        Lesson2c()
    }
}
