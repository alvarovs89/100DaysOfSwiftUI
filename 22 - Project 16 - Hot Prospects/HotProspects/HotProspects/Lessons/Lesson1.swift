//
//  ContentView.swift
//  HotProspectsLessons
//
//  Created by Alvaro Valdes Salazar on 08-07-21.
//

import SwiftUI

class User: ObservableObject {
    @Published var name = "Taylor Swift"
}

struct Editview: View {
    @EnvironmentObject var user: User
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User
    var body: some View {
        Text(user.name)
    }
}
struct Lesson1: View {
    let user = User()
    var body: some View {
        VStack {
            Editview().environmentObject(user)
            DisplayView().environmentObject (user)
        }
    }
}

struct Lesson1_Previews: PreviewProvider {
    static var previews: some View {
        Lesson1()
    }
}
