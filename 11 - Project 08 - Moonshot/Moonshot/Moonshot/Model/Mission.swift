//
//  Mission.swift
//  Moonshot
//
//  Created by Alvaro Valdes Salazar on 09-08-20.
//  Copyright © 2020 Alvaro Valdes Salazar. All rights reserved.
//

import Foundation

struct Mission: Codable, Identifiable {

    
        struct CrewRole: Codable {
            let name: String
            let role: String
            
    }

    
   
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    var image: String {
        "apollo\(id)"
    }
    
     var crewNames: String {
            var temp: String = ""
            let crewCount = crew.count
            
            for (index, member) in crew.enumerated() {
                if index != crewCount - 1 {
                    temp += member.name + ", "
                } else {
                    temp += member.name
                }
            }
            return temp
    }
    

    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
}
