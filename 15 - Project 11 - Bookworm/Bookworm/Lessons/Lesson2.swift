//
//  Lesson2.swift
//  Bookworm
//
//  Created by Alvaro Valdes Salazar on 09-09-20.
//  Copyright © 2020 Alvaro Valdes Salazar. All rights reserved.

//https://www.hackingwithswift.com/books/ios-swiftui/using-size-classes-with-anyview-type-erasure
//TITLE: Using size classes with AnyView type erasure

import SwiftUI

struct Lesson2: View {
    @Environment(\.horizontalSizeClass) var sizeClass

    var body: some View {
        if sizeClass == .compact {
            return AnyView(VStack {
                Text("Active size class:")
                Text("COMPACT")
            }
            .font(.largeTitle))
        } else {
            return AnyView(HStack {
                Text("Active size class:")
                Text("REGULAR")
            }
            .font(.largeTitle))
        }
    }
}
struct Lesson2_Previews: PreviewProvider {
    static var previews: some View {
        Lesson2()
    }
}
