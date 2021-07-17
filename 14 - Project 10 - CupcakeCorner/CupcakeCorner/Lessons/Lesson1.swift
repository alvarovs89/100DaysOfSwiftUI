//
//  Lessson1.swift
//  CupcakeCorner
//
//  Created by Alvaro Valdes Salazar on 05-09-20.
//  Copyright © 2020 Alvaro Valdes Salazar. All rights reserved.
//https://www.hackingwithswift.com/books/ios-swiftui/adding-codable-conformance-for-published-properties

//TITLE: Adding Codable conformance for @Published properties

import SwiftUI

class User1: ObservableObject, Codable {
//first step is to create a CodingKeys enum that conforms to CodingKey, listing all the properties we want to archive and unarchive. Add this inside the User class now:
    enum CodingKeys1:CodingKey {
        case name1
    }
    
    var name1 = "Alvaro Valdes"
    
//The next task is to create a custom initializer that will be given some sort of container, and use that to read values for all our properties. This will involve learning a few new things, but let’s look at the code first – add this initializer to User now:
    
    
    required init(from decoder1: Decoder) throws {
        let container1 = try decoder1.container(keyedBy: CodingKeys1.self)
        name1 = try container1.decode(String.self, forKey: .name1)
    }
    
//    First, this initializer is handed an instance of a new type called Decoder. This contains all our data, but it’s down to us to figure out how to read it.
//
//    Second, anyone who subclasses our User class must override this initializer with a custom implementation to make sure they add their own values. We mark this using the required keyword: required init. An alternative is to mark this class as final so that subclassing isn’t allowed, in which case we’d write final class User and drop the required keyword entirely.
//
//    Third, inside the method we ask our Decoder instance for a container matching all the coding keys we already set in our CodingKey struct by writing decoder.container(keyedBy: CodingKeys.self). This means “this data should have a container where the keys match whatever cases we have in our CodingKeys enum. This is a throwing call, because it’s possible those keys don’t exist.
//
//    Finally, we can read values directly from that container by referencing cases in our enum – container.decode(String.self, forKey: .name). This provides really strong safety in two ways: we’re making it clear we expect to read a string, so if name gets changed to an integer the code will stop compiling; and we’re also using a case in our CodingKeys enum rather than a string, so there’s no chance of typos.


    
//    There’s one more task we need to complete before the User class conforms to Codable: we’ve made an initializer so that Swift can decode data into this type, but now we need to tell Swift how to encode this type – how to archive it ready to write to JSON.
//
//    This step is pretty much the reverse of the initializer we just wrote: we get handed an Encoder instance to write to, ask it to make a container using our CodingKeys enum for keys, then write our values attached to each key.
//
//    Add this method to the User class now:

    func encode1(to encoder1: Encoder) throws {
        var container1 = encoder1.container(keyedBy: CodingKeys1.self)
        try container1.encode(name1, forKey: .name1)
    }
    
}


struct Lesson1: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Lessson1_Previews: PreviewProvider {
    static var previews: some View {
        Lesson1()
    }
}
