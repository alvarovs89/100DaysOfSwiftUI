//
//  Lesson2b.swift
//  SnowSeekerLessons
//
//  Created by Alvaro Valdes Salazar on 19-07-21.
//

import SwiftUI

struct Lesson2b: View {
    @State private var selectedUser: User? = nil
     @State private var isShowingAlert = false

     var body: some View {
         Text("Hello, World!")
             .onTapGesture {
                 self.selectedUser = User()
                 self.isShowingAlert = true
             }
             .alert(isPresented: $isShowingAlert) {
                 Alert(title: Text(selectedUser!.id))
             }
     }
 }

struct Lesson2b_Previews: PreviewProvider {
    static var previews: some View {
        Lesson2b()
    }
}
