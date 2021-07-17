//
//  User.swift
//  FriendFace
//
//  Created by Alvaro Valdes Salazar on 04-10-20.
//

import Foundation
import SwiftUI




//struct Response: Codable {
//    var users: [User]
//}

struct User: Codable, Identifiable {
    public var id : String
//    var isActive : Bool?
    public var name : String
    public var age: Int
    public var company: String
    public var email: String
    public var address: String
//    var about: String
//    var registered: String?
//    var tags: [String]
    var friends: [Friend]
    
    public struct Friend: Codable, Identifiable {
        public var id : String
        public var name: String
    }


}


