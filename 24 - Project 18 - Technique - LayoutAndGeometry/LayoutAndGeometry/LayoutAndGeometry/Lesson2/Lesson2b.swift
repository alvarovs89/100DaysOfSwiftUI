//
//  Lesson2b.swift
//  LayoutAndGeometry
//
//  Created by Alvaro Valdes Salazar on 17-07-21.
//

import SwiftUI

struct Lesson2b: View {
    var body: some View {
      //  HStack(alignment: .bottom) {
        HStack(alignment: .lastTextBaseline) {

            Text("Live")
                .font(.caption)
            Text("long")
            Text("and")
                .font(.title)
            Text("prosper")
                .font(.largeTitle)
        }
        
    }
}

struct Lesson2b_Previews: PreviewProvider {
    static var previews: some View {
        Lesson2b()
    }
}
