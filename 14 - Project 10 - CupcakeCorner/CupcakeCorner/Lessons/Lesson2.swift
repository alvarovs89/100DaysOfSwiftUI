//
//  Lesson2.swift
//  CupcakeCorner
//
//  Created by Alvaro Valdes Salazar on 05-09-20.
//  Copyright © 2020 Alvaro Valdes Salazar. All rights reserved.
////https://www.hackingwithswift.com/books/ios-swiftui/sending-and-receiving-codable-data-with-urlsession-and-swiftui

//TITLE: Sending and receiving Codable data with URLSession and SwiftUI


import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct Lesson2: View {
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading){
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .onAppear(perform: loadData)
    }
    
//    That won’t show anything at first, because the results array is empty. This is where our networking call comes in: we’re going to ask the iTunes API to send us a list of all the songs by Taylor Swift, then use JSONDecoder to convert those results into an array of Result instances.
//
//    To make this easier to understand, let’s write it in a few stages. First, here’s the basic method stub – please add this to the ContentView struct:
    
//    Inside loadData() we have four steps we need to complete:
//
//  1.  Creating the URL we want to read.
//  2.  Wrapping that in a URLRequest, which allows us to configure how the URL should be accessed.
//  3.  Create and start a networking task from that URL request.
//  4.  Handle the result of that networking task.
    
    func loadData () {
        
//    Step 1.       We’ll add those step by step, starting with the URL. This needs to have a precise format: “itunes.apple.com” followed by a series of parameters – you can find the full set of parameters if you do a web search for “iTunes Search API”. In our case we’ll be using the search term “Taylor Swift” and the entity “song”, so add this to loadData() now:
        guard let url1 = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
//  Step 2.   Next we need to wrap that URL into a URLRequest. Again, this is where we would add different customizations to control the way the URL was loaded, but here we don’t need anything so this is just a single line of code – add this to loadData() next:

        let request1 = URLRequest(url: url1)
    
// Step 3. ==============

        URLSession.shared.dataTask(with: request1) { data1, response1, error1 in
// Step 4. ==============
            if let data1 = data1 {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data1) {
                    // we have good data – go back to the main thread
                    DispatchQueue.main.async {
                        // update our UI
                        self.results = decodedResponse.results
                    }

                    // everything is good, so we can exit
                    return
                }
            }

            // if we're still here it means there was a problem
            print("Fetch failed: \(error1?.localizedDescription ?? "Unknown error")")
// End Step 4. =============
        }.resume()

// End Step 3. ==============

    }
}

struct Lesson2_Previews: PreviewProvider {
    static var previews: some View {
        Lesson2()
    }
}
