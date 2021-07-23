//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Alvaro Valdes Salazar on 22-07-21.
//

import SwiftUI


class Favorites: ObservableObject {
    // the actual resorts the user has favorited
    private var resorts: Set<String>
    @State private var cards = [Facility]()


    // the key we're using to read/write in UserDefaults
    private let saveKey = "Favorites"
//MARK: - CHALLENGE 2
    init() {
        // load our saved data
//MARK: - CHALLENGE 2.1 - DAY 99 - LOAD DATA
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode(Set<String>.self, from: data) {
                self.resorts = decoded
                print(decoded)
                return // REMEMBER TO ADD RETURN

            }
        }

        // still here? Use an empty array
        self.resorts = []
    }

    // returns true if our set contains this resort
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }

    // adds the resort to our set, updates all views, and saves the change
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }

    // removes the resort from our set, updates all views, and saves the change
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }

//MARK: - CHALLENGE 2.2 - DAY 99 - SAVE DATA
    func save() {
        if let data = try? JSONEncoder().encode(resorts) {
            UserDefaults.standard.set(data, forKey: saveKey)
        }
        // write out our data
    }
}
