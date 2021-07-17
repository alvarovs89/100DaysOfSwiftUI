//
//  Lesson8.swift
//  HotProspectsLessons
//
//  Created by Alvaro Valdes Salazar on 08-07-21.
// https://www.hackingwithswift.com/books/ios-swiftui/adding-swift-package-dependencies-in-xcode
//TITLE: Adding Swift package dependencies in Xcode

import SamplePackage
import SwiftUI

struct Lesson8: View {
    let possibleNumbers = Array(1...60)
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.joined(separator: ", ")

    }
    var body: some View {
        Text(results)
    }
}

struct Lesson8_Previews: PreviewProvider {
    static var previews: some View {
        Lesson8()
    }
}
