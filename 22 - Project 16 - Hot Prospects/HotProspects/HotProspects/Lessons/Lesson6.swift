//
//  Lesson6.swift
//  HotProspectsLessons
//
//  Created by Alvaro Valdes Salazar on 08-07-21.
//

//https://www.hackingwithswift.com/books/ios-swiftui/creating-context-menus

//TITLE: Creating context menus


import SwiftUI

struct Lesson6: View {
    @State private var backgroundColor = Color.red
    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
                .background(backgroundColor)

            Text("Change Color")
                .padding()
                .contextMenu {
                    Button(action: {
                        self.backgroundColor = .red
                    }) {
                        Text("Red")
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.red)
                    }

                    Button(action: {
                        self.backgroundColor = .green
                    }) {
                        Text("Green")
                    }

                    Button(action: {
                        self.backgroundColor = .blue
                    }) {
                        Text("Blue")
                    }
                }
        }
    }
}


struct Lesson6_Previews: PreviewProvider {
    static var previews: some View {
        Lesson6()
    }
}
