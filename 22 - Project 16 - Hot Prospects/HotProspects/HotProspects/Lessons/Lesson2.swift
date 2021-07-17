//
//  Lesson2.swift
//  HotProspectsLessons
//
//  Created by Alvaro Valdes Salazar on 08-07-21.
//

import SwiftUI

struct Lesson2: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
          Text("Tab 1")
              .onTapGesture {
                  self.selectedTab = 1
              }
              .tabItem {
                  Image(systemName: "star")
                  Text("One")
              }
              .tag(0)

          Text("Tab 2")
              .tabItem {
                  Image(systemName: "star.fill")
                  Text("Two")
              }
              .tag(1)
      }
  }
}

struct Lesson2_Previews: PreviewProvider {
    static var previews: some View {
        Lesson2()
    }
}
