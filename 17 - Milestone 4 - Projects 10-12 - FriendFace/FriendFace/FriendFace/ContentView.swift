//
//  ContentView.swift
//  FriendFace
//
//  Created by Alvaro Valdes Salazar on 04-10-20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var fetcher = UserFetcher()
    
//    var users : [User] = []
//    var user: User

    var body: some View {
        NavigationView {
            List(fetcher.allUsers) { user in
                NavigationLink(destination: UserDetailsView(fetcher: fetcher, user: user),
                    label: {
                        VStack(alignment:.leading ) {
                            Text(user.name)
                                .font(.headline)
                            Text(user.email)
                                .font(.caption)
                        }
                    })
                }
        .navigationBarTitle(Text("FriendFace"))

        }
    }
}


        



struct ContentView_Previews: PreviewProvider {
    
    static let john = User(id: "123", name: "John Smith", age: 54, company: "Apple", email: "john.smith@apple.com", address: "Cupertino", friends: [])
    static var previews: some View {
        ContentView()
    }
}
