//
//  Lesson7a.swift
//  LayoutAndGeometry
//
//  Created by Alvaro Valdes Salazar on 17-07-21.
//

import SwiftUI

struct Lesson7a: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(width: fullView.size.width)
                            .background(self.colors[index % 7])
                            .rotation3DEffect(.degrees(Double(geo.frame(in: .global).minY) / 5), axis: (x: 0, y: 1, z: 0))

                            .rotation3DEffect(.degrees(Double(geo.frame(in: .global).minY - fullView.size.height / 2) / 5), axis: (x: 0, y: 1, z: 0))

                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

struct Lesson7a_Previews: PreviewProvider {
    static var previews: some View {
        Lesson7a()
    }
}
