//
//  Lesson2a.swift
//  SnowSeekerLessons
//
//  Created by Alvaro Valdes Salazar on 19-07-21.

//https://www.hackingwithswift.com/books/ios-swiftui/using-alert-and-sheet-with-optionals
//Using alert() and sheet() with optionals


import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct Lesson2a: View {
    @State private var selectedUser: User? = nil

    var body: some View {
        Text("Hello, World!")
            .onTapGesture {
                self.selectedUser = User()
            }
            .alert(item: $selectedUser) { user in
                Alert(title: Text(user.id))
            }
    }
}

struct Lesson2a_Previews: PreviewProvider {
    static var previews: some View {
        Lesson2a()
    }
}
