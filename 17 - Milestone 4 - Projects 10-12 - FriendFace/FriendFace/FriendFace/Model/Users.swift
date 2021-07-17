//
//  AllUsersClass.swift
//  FriendFace
//
//  Created by Alvaro Valdes Salazar on 06-10-20.
//

import Foundation
import SwiftUI
import Combine

public class UserFetcher: ObservableObject {
    
    @Published var allUsers = [User]()

//    init(users: [User]) {
//        self.all = users
//    }
//
//    init() {
//        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
//            print("Invalid URL")
//            return
//        }
//
//        let request = URLRequest(url: url)
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {
//                if let decodedResponse = try? JSONDecoder().decode([Users].self, from: data) {
//                    DispatchQueue.main.async {
//                        self.all = decodedResponse
//                    }
//                    return
//                }
//            }
//            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
//        }.resume()
//    }
    
    init(){
        load()
    }
    
    func load() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
    
        URLSession.shared.dataTask(with: url) {(data,response,error) in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode([User].self, from: d)
                    DispatchQueue.main.async {
                        self.allUsers = decodedLists
                    }
                }else {
                    print("No Data")
                }
            } catch {
                print ("Error")
            }
            
        }.resume()
         
    }
    
//    init() {
//        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
//            print("Invalid URL")
//            return
//        }
//
//        let request = URLRequest(url: url)
//
//        let session = URLSession.shared.dataTask(with: request) { data, response, sessionError in
//            guard let data = data else {
//                print("Fetch failed: \(sessionError?.localizedDescription ?? "Unknown error")")
//                return
//            }
//
//            do {
//                var decoded = try JSONDecoder().decode([User].self, from: data)
//                // sort
//                decoded.sort { $0.name < $1.name }
//                for (i, _) in decoded.enumerated() {
//                    decoded[i].friends.sort { $0.name < $1.name }
//                }
//                DispatchQueue.main.async { [weak self] in
//                    self?.all = decoded
//                }
//            }
//            catch let decodingError {
//                print("Decoding failed: \(decodingError.localizedDescription)")
//            }
//        }
//
//        DispatchQueue.global().async {
//            session.resume()
//        }
//    }
}
