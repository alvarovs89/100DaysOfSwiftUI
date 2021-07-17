//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Alvaro Valdes Salazar on 09-08-20.
//  Copyright © 2020 Alvaro Valdes Salazar. All rights reserved.
//

import Foundation
//we want to convert astronauts.json into an array of Astronaut instances, which means we need to use Bundle to find the path to the file, load that into an instance of Data, and pass it through a JSONDecoder. Previously we put this into a method on ContentView, but here I’d like to show you a better way: we’re going to write an extension on Bundle to do it all in one centralized place
//Create another new Swift file, this time called Bundle-Decodable.swift. This will mostly use code you’ve seen before, but there’s one small difference: previously we used String(contentsOf:) to load files into a string, but because Codable uses Data we are instead going to use Data(contentsOf:). It works in just the same way as String(contentsOf:): give it a file URL to load, and it either returns its contents or throws an error.

extension Bundle {

//    func decode(_ file: String) -> [Astronaut] {
        
//  Generics allow us to write code that is capable of working with a variety of different types. In this project, we wrote the Bundle extension to work with arrays of astronauts, but really we want to be able to handle arrays of astronauts, arrays of missions, or potentially lots of other things.

//  To make a method generic, we give it a placeholder for certain types. This is written in angle brackets (< and >) after the method name but before its parameters, like this:
        
//  We can use anything for that placeholder – we could have written “Type”, “TypeOfThing”, or even “Fish”; it doesn’t matter. “T” is a bit of a convention in coding, as a short-hand placeholder for “type”.
//  Inside the method, we can now use “T” everywhere we would use [Astronaut] – it is literally a placeholder for the type we want to work with. So, rather than returning [Astronaut] we would use this:
    func decode<T: Codable>(_ file: String) -> T {

        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()
        
        
 //We already used the dateStyle and timeStyle properties of DateFormatter for using one of the built-in styles, but here we’re going to use its dateFormat property to specify a precise format: “y-MM-dd”. That’s Swift’s way of saying “a year, then a dash, then a zero-padded month, then a dash, then a zero-padded day”, with “zero-padded” meaning that January is written as “01” rather than “1”.

// Warning: Date formats are case sensitive! mm means “zero-padded minute” and MM means “zero-padded month.”

// So, open Bundle-Decodable.swift and add this code directly after let decoder = JSONDecoder():
        
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)

        
        

//        guard let loaded = try? decoder.decode([Astronaut].self, from: data) else {
//Towards the end of the decode() method there’s another place where [Astronaut] is use, Again, please change that to T, like this:

            guard let loaded = try? decoder.decode(T.self, from: data) else {

            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
    
}
