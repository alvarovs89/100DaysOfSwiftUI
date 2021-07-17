//
//  Lesson7.swift
//  HotProspectsLessons
//
//  Created by Alvaro Valdes Salazar on 08-07-21.

//https://www.hackingwithswift.com/books/ios-swiftui/scheduling-local-notifications

//TITLE: Scheduling local notifications


import UserNotifications
import SwiftUI

struct Lesson7: View {
    var body: some View {
        VStack {
            Button("Request permission") {
                //FIRST
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
            Button("Schedule Notification") {
                // SECOND
                let content = UNMutableNotificationContent()
                content.title = "Feed the cat"
                content.subtitle = "It looks hungry"
                content.sound = UNNotificationSound.default

                // show this notification five seconds from now
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                // choose a random identifier
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                // add our notification request TO THE SYSTEM
                UNUserNotificationCenter.current().add(request)
                
                
            }
            
        }
    }
}

struct Lesson7_Previews: PreviewProvider {
    static var previews: some View {
        Lesson7()
    }
}
