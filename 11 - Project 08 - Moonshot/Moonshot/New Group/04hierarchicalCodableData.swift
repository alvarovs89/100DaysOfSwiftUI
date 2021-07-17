//////
//////  04hierarchicalCodableData.swift
//////  Moonshot
//////
//////  Created by Alvaro Valdes Salazar on 09-08-20.
//////  Copyright © 2020 Alvaro Valdes Salazar. All rights reserved.
//////
////
//import SwiftUI
//
//struct _4hierarchicalCodableData: View {
//    var body: some View {
//        Button("Decode JSON") {
//            let input = """
//            {
//                "name": "Taylor Swift",
//                "address": {
//                    "street": "555, Taylor Swift Avenue",
//                    "city": "Nashville"
//                }
//            }
//            """
//
//            struct User: Codable {
//                var name: String
//                var address: Address
//            }
//
//            struct Address: Codable {
//                var street: String
//                var city: String
//            }
//            
//            let data = Data(input.utf8)
//            let decoder = JSONDecoder()
//            if let user = try? decoder.decode(User.self, from: data) {
//                print(user.address.street)
//            }
//        }
//        
//    }
//}
//
//struct _4hierarchicalCodableData_Previews: PreviewProvider {
//    static var previews: some View {
//        _4hierarchicalCodableData()
//    }
//}
