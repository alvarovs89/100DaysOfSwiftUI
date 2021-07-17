//
//  Order.swift
//  CupcakeCorner
//
//  Created by Alvaro Valdes Salazar on 08-09-20.
//  Copyright © 2020 Alvaro Valdes Salazar. All rights reserved.
//

import Foundation

class Order: ObservableObject, Codable {
//1. That first step means adding an enum that conforms to CodingKey, listing all the properties we want to save. In our Order class that’s almost everything – the only thing we don’t need is the static types property.
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
    }
// end 1.
    
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

    @Published var type = 0
    @Published var quantity = 3

    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        //challenge 1 pat.2
        if name.isBlank || streetAddress.isBlank || city.isBlank || zip.isBlank {
            return false
        }
        

        return true
    }
    
    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2

        // complicated cakes cost more
        cost += (Double(type) / 2)

        // $1/cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }

        // $0.50/cake for sprinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }

        return cost
    }

// The problem now is that we just created a custom initializer for our Order class, init(from:), and Swift wants us to use it everywhere – even in places where we just want to create a new empty order because the app just started.

//        Fortunately, Swift lets us add multiple initializers to a class, so that we can create it in any number of different ways. In this situation, that means we need to write a new initializer that can create an order without any data whatsoever – it will rely entirely on the default property values we assigned.
    init() { }
    
//3.Our final step is to implement a required initializer to decode an instance of Order from some archived data. This is pretty much the reverse of encoding, and even benefits from the same throws functionality:
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)

        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)

        name = try container.decode(String.self, forKey: .name)
        streetAddress = try container.decode(String.self, forKey: .streetAddress)
        city = try container.decode(String.self, forKey: .city)
        zip = try container.decode(String.self, forKey: .zip)
    }
// end 3.
//2. The second step requires us to write an encode(to:) method that creates a container using the coding keys enum we just created, then writes out all the properties attached to their respective key. This is just a matter of calling encode(_:forKey:) repeatedly, each time passing in a different property and coding key.

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)

        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSprinkles, forKey: .addSprinkles)

        try container.encode(name, forKey: .name)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
    }
}


//challenge 1 pat.1
extension String {
    
    /// A Boolean value indicating whether a string has only whitespaces.
    var isBlank: Bool {
        return allSatisfy({ $0.isWhitespace })
    }
}
