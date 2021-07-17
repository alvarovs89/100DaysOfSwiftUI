//
//  Lesson4.swift
//  HotProspectsLessons
//
//  Created by Alvaro Valdes Salazar on 08-07-21.
//

import SwiftUI

class DelayUpdater: ObservableObject {
    // Now, if you remove the @Published property wrapper you’ll see the UI no longer changes. Behind the scenes all the asyncAfter() work is still happening, but it doesn’t cause the UI to refresh any more because no change notifications are being sent out.
    //@Published var value = 0
    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }
    
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
                print(i)
            }
        }
    }
}

struct Lesson4: View {
    @ObservedObject var updater = DelayUpdater()
    var body: some View {
        Text("Value is: \(updater.value)")
    }
}

struct Lesson4_Previews: PreviewProvider {
    static var previews: some View {
        Lesson4()
    }
}
