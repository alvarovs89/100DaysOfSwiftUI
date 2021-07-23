//
//  Lesson3a.swift
//  SnowSeekerLessons
//
//  Created by Alvaro Valdes Salazar on 21-07-21.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna, Arya, and Toby")
        }
    }
}
struct Lesson3a: View {
    @Environment(\.horizontalSizeClass) var sizeClass

    var body: some View {
        Group {
//            if sizeClass == .compact {
//                 VStack {
//                     UserView()
//                 }
//             } else {
//                 HStack {
//                     UserView()
//                 }
//             }
            //Tip: In situations like this, where you have only one view inside a stack and it doesn’t take any parameters, you can pass the view’s initializer directly to the VStack to make your code shorter:
            

            if sizeClass == .compact {
                VStack(content: UserView.init)
            } else {
                HStack(content: UserView.init)
            }
         }
     }
 }

struct Lesson3a_Previews: PreviewProvider {
    static var previews: some View {
        Lesson3a()
    }
}
