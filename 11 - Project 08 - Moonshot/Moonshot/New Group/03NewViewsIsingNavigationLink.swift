//
//  03NewViewsIsingNavigationLink.swift
//  Moonshot
//
//  Created by Alvaro Valdes Salazar on 09-08-20.
//  Copyright © 2020 Alvaro Valdes Salazar. All rights reserved.
//

import SwiftUI


//So, both sheet() and NavigationLink allow us to show a new view from the current one, but the way they do it is different and you should choose them carefully:

//NavigationLink is for showing details about the user’s selection, like you’re digging deeper into a topic.
//sheet() is for showing unrelated content, such as settings or a compose window.
//The most common place you see NavigationLink is with a list, and there SwiftUI does something quite marvelous.



struct _3NewViewsIsingNavigationLink: View {
    var body: some View {
        NavigationView {
//            VStack {
//                NavigationLink(destination: Text("Detail View")) {
//                    Text("Hello World")
//                }
//            }
            
            List(0..<100) { row in
                NavigationLink(destination: Text("Detail \(row)")) {
                    Text("Row \(row)")
                }
            }
            .navigationBarTitle("SwiftUI")
        }
        
    }
}

struct _3NewViewsIsingNavigationLink_Previews: PreviewProvider {
    static var previews: some View {
        _3NewViewsIsingNavigationLink()
    }
}
