//
//  Lesson3.swift
//  CupcakeCorner
//
//  Created by Alvaro Valdes Salazar on 06-09-20.
//  Copyright © 2020 Alvaro Valdes Salazar. All rights reserved.

//https://www.hackingwithswift.com/books/ios-swiftui/validating-and-disabling-forms
// TITLE: Validating and disabling forms


import SwiftUI

struct Lesson3: View {
    @State private var username = ""
    @State private var email = ""
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }

    var body: some View {
        Form {
           Section {
               TextField("Username", text: $username)
               TextField("Email", text: $email)
           }

           Section {
               Button("Create account") {
                   print("Creating account…")
               }
           }
//           .disabled(username.isEmpty || email.isEmpty)
            .disabled(disableForm)

        }
    }
}

struct Lesson3_Previews: PreviewProvider {
    static var previews: some View {
        Lesson3()
    }
}
