//
//  Lesson1.swift
//  ViewsAndModifiers
//
//  Created by Alvaro Valdes Salazar on 03-10-20.
//What is behind the main SwiftUI view?
//https://www.hackingwithswift.com/books/ios-swiftui/what-is-behind-the-main-swiftui-view

import SwiftUI

struct Lesson1: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red)
            .edgesIgnoringSafeArea(.all)
    }
}

struct Lesson1_Previews: PreviewProvider {
    static var previews: some View {
        Lesson1()
    }
}
