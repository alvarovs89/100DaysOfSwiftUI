//
//  Lesson3b.swift
//  SnowSeekerLessons
//
//  Created by Alvaro Valdes Salazar on 21-07-21.
//

import SwiftUI

struct Lesson3b: View {
    @State private var layoutVertically = false

    var body: some View {
        Group {
             if layoutVertically {
                 VStack {
                     UserView()
                 }
             } else {
                 HStack {
                     UserView()
                 }
             }
         }
         .onTapGesture {
             self.layoutVertically.toggle()
         }
     }
 }

struct Lesson3b_Previews: PreviewProvider {
    static var previews: some View {
        Lesson3b()
    }
}
