//
//  Card.swift
//  Flashzilla
//
//  Created by Alvaro Valdes Salazar on 13-07-21.
//

import Foundation

struct Card: Codable {
    let prompt: String
    let answer: String

    static var example: Card {
        Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
}
