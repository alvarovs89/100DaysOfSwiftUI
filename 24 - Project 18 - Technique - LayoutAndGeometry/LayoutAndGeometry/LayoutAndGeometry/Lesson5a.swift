//
//  Lesson5a.swift
//  LayoutAndGeometry
//
//  Created by Alvaro Valdes Salazar on 17-07-21.

//Understanding frames and coordinates inside GeometryReader
//https://www.hackingwithswift.com/books/ios-swiftui/understanding-frames-and-coordinates-inside-geometryreader

import SwiftUI

struct Lesson5a: View {
    var body: some View {
        VStack {
            GeometryReader { geo in
                Text("Hello, World!")
                    .frame(width: geo.size.width * 0.9, height: 40)
                    .background(Color.red)
            }.background(Color.green)
            Text("More text")
                .background(Color.blue)
            
        }
    }
}

struct Lesson5a_Previews: PreviewProvider {
    static var previews: some View {
        Lesson5a()
    }
}
