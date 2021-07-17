//
//  Lesson3a.swift
//  LayoutAndGeometry
//
//  Created by Alvaro Valdes Salazar on 17-07-21.
//
//How to create a custom alignment guide
//https://www.hackingwithswift.com/books/ios-swiftui/how-to-create-a-custom-alignment-guide

import SwiftUI

extension VerticalAlignment {
    struct MidAccountAndName: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.top]
        }
    }

    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct Lesson3a: View {
    var body: some View {
        //To be clear, that means “align these two views so their centers are both on the .midAccountAndName guide”.
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@twostraws")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                Image("yoga")
                    .resizable()
                    .frame(width: 64, height: 64)
            }.background(Color.red)

            VStack {
                Text("Full name:")
                Text("PAUL HUDSON")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }

                    .font(.largeTitle)
            }.background(Color.green)
        }.background(Color.blue)
    }
}

struct Lesson3a_Previews: PreviewProvider {
    static var previews: some View {
        Lesson3a()
    }
}
