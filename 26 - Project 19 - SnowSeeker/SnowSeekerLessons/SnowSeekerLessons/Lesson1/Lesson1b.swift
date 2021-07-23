//
//  Lesson1b.swift
//  SnowSeekerLessons
//
//  Created by Alvaro Valdes Salazar on 18-07-21.
//

import SwiftUI

struct Lesson1b: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: Text("New secondary")) {
                Text("Hello, World!")
            }
            .navigationBarTitle("Primary")

            Text("Secondary body")
                .navigationTitle("Secondary")
        }
        
    }
}

struct Lesson1b_Previews: PreviewProvider {
    static var previews: some View {
        Lesson1b()
    }
}
