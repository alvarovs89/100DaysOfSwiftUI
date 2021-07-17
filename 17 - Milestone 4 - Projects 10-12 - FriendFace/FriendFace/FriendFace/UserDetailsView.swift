//
//  UserDetails.swift
//  FriendFace
//
//  Created by Alvaro Valdes Salazar on 05-10-20.
//

import SwiftUI

struct UserDetailsView: View {
    @ObservedObject var fetcher = UserFetcher()
    var user : User
    
    
    var body: some View {
        VStack(alignment: .center) {
            Text(user.name)
                .font(.title)
            VStack(alignment: .leading) {
                Text("Age: \(user.age)")
    //            Spacer()
                Text("Company: \(user.company)")
                Text("Mail: \(user.email)")
            }


        }
        .navigationBarTitle(Text(user.name))
    }
    

}

struct UserDetailsView_Previews: PreviewProvider {

    static let jOhn = User(id: "123", name: "John Smith", age: 54, company: "Apple", email: "john.smith@apple.com", address: "Cupertino", friends: [])
    var allUsers:[User] = [jOhn]

    static var previews: some View {
        UserDetailsView(user: jOhn)

    }
}
