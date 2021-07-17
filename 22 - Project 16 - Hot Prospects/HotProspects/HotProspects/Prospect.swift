//
//  Prospect.swift
//  HotProspects
//
//  Created by Alvaro Valdes Salazar on 09-07-21.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
    var dateAdded = Date()
}


class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    static let saveKey = "SavedData"

//
    init() {
//      if let data = UserDefaults.standard.data(forKey: Self.saveKey) {
//            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
//                self.people = decoded
//                return
//            }
//        }
//        self.people = []
//    }
//
//        // CHALLENGE 2 - Use JSON and the documents directory for saving and loading our user data.

        if let data = FileManager().loadData(withName: Self.saveKey) {
          self.people = data
          return
                  }
        self.people = []
        
    }
        

    private func save() {
        if let encoded = try? JSONEncoder().encode(people) {
            FileManager().saveData(encoded, withName: Self.saveKey )     //  Saving in Json with extention
//            UserDefaults.standard.set(encoded, forKey: Self.saveKey)  //      saving in userdefaults
        }
    }

    
    func toggle(_ prospect: Prospect) {
        //Important: You should call objectWillChange.send() before changing your property, to ensure SwiftUI gets its animations correct.
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
        
    }
    
    // sorting code //
    enum Sorter {
        case name, dateAdded
    
    }
    func sort(by sorter: Sorter) {
        if sorter == .name {
            people.sort { (lhs, rhs) -> Bool in
                lhs.name < rhs.name
            }
        } else if sorter == .dateAdded {
            people.sort { (lhs, rhs) -> Bool in
                lhs.dateAdded > rhs.dateAdded
            }
        }
    }
}

extension FileManager {
    
    //1. GET DIRECTORY
    func getDocumentsDirectory()-> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func saveData(_ userData: Data, withName name: String) {
        let filename = getDocumentsDirectory().appendingPathComponent(name)
        do {
            try userData.write(to: filename, options:[.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }

    
    func loadData(withName name: String) -> [Prospect]? {
        let filename = getDocumentsDirectory().appendingPathComponent(name)
        do {
            let data = try Data(contentsOf: filename)
            let decoded = try JSONDecoder().decode([Prospect].self, from: data)
            return decoded
        } catch {
            print("Unable to load saved data." + error.localizedDescription )
        }
        return nil
    }
    
}
