//
//  Lesson2.swift
//  LayoutAndGeometry
//
//  Created by Alvaro Valdes Salazar on 17-07-21.

//Alignment and alignment guides
//https://www.hackingwithswift.com/books/ios-swiftui/alignment-and-alignment-guides

import SwiftUI

struct Lesson2: View {
    var body: some View {
        Text("Live long and prosper")
            .frame(width: 300, height: 300, alignment: .topLeading)
            //You can then use offset(x:y:) to move the text around inside that frame.
            

            .background(Color.red)
        
    }
}

struct Lesson2_Previews: PreviewProvider {
    static var previews: some View {
        Lesson2()
    }
}
