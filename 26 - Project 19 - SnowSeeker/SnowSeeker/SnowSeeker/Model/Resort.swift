//
//  Resort.swift
//  SnowSeeker
//
//  Created by Alvaro Valdes Salazar on 21-07-21.
//

import Foundation
struct Resort: Codable, Identifiable {
    let id: String
    let name: String
    let country: String
    let description: String
    let imageCredit: String
    let price: Int
    let size: Int
    let snowDepth: Int
    let elevation: Int
    let runs: Int
    let facilities: [String]
    
    
    static let allResorts: [Resort] = Bundle.main.decode("resorts.json")
    static let example = allResorts[0]

    
//    
//    Next, we’re going to update the Resort struct so that it has a computed property containing its facilities as an array of Facility rather than String. This means we still load the original string array from JSON, but have a [Facility] alternative ready to hand. Ideally this would be done with a custom Codable initializer, but I don’t want to cover that all over again!

    var facilityTypes: [Facility] {
        facilities.map(Facility.init)
    }

}
