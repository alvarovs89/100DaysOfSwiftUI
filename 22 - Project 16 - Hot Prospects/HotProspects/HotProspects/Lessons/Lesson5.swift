//
//  Lesson5.swift
//  HotProspectsLessons
//
//  Created by Alvaro Valdes Salazar on 08-07-21.
//

import SwiftUI

struct Lesson5: View {
    var body: some View {
        Image("example")
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
        
    }
}

struct Lesson5_Previews: PreviewProvider {
    static var previews: some View {
        Lesson5()
    }
}
