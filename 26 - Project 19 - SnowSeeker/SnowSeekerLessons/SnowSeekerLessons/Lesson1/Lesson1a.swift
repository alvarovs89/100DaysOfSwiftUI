//
//  Lesson1a.swift
//  SnowSeekerLessons
//
//  Created by Alvaro Valdes Salazar on 18-07-21.
//

//Working with two side by side views in SwiftUI
//https://www.hackingwithswift.com/books/ios-swiftui/working-with-two-side-by-side-views-in-swiftui

import SwiftUI


struct Lesson1a: View {
    var body: some View {
        NavigationView {
            Text("Hello, World!")
                .navigationBarTitle("Primary")
            Text("Secondary")
        }
    }
}

struct Lesson1a_Previews: PreviewProvider {
    static var previews: some View {
        Lesson1a()
    }
}
