//
//  ContentView.swift
//  Challenge01
//
//  Created by Alvaro Valdes Salazar on 16-07-20.
//  Copyright © 2020 Alvaro Valdes Salazar. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    @State private var inputUnit = ""
     private let units = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    
    
    @State private var medInicial = 0
    @State private var medFinal = 2

   private var conversion: Double {
        let unitToConvert = Double(inputUnit) ?? 0
        
        if medInicial == 0 { //Meters
            switch (medFinal) {
            case 1:
                // m -> km
                return unitToConvert/1000
            case 2:
                // m -> ft
                return unitToConvert*3.281
            case 3:
                // m -> yd
                return unitToConvert*1.094
            case 4:
                // m -> miles
                return unitToConvert/1609
            default:
                // m -> m
                return unitToConvert
            }
        } else if medInicial == 1 { //Kilometers
            switch (medFinal) {
            case 0:
                // km -> m
                return unitToConvert*1000
            case 2:
                // km -> ft
                return unitToConvert*3281
            case 3:
                // km -> yd
                return unitToConvert*1094
            case 4:
                // km -> miles
                return unitToConvert/1.609
            default:
                // km -> km
                return unitToConvert
            }
        }else if medInicial == 2 { //Feet
            switch (medFinal) {
            case 0:
                // ft -> m
                return unitToConvert/3.281
            case 1:
                // ft -> km
                return unitToConvert/3281
            case 3:
                // ft -> yd
                return unitToConvert/3
            case 4:
                // ft -> miles
                return unitToConvert/5280
            default:
                // ft -> ft
                return unitToConvert
            }
        } else if medInicial == 3 { //Yards
        switch (medFinal) {
        case 0:
            // yd -> m
            return unitToConvert/1.094
        case 1:
            // yd -> km
            return unitToConvert/1094
        case 2:
            // yd -> ft
            return unitToConvert*3
        case 4:
            // yd -> mi
            return unitToConvert/1760
        default:
            // yd -> yd
            return unitToConvert
        }
    } else if medInicial == 4 { //Miles
        switch (medFinal) {
        case 0:
            // mi -> m
            return unitToConvert*1609
        case 1:
            // mi -> km
            return unitToConvert*1.609
        case 2:
            // mi -> ft
            return unitToConvert*5280
        case 4:
            // mi -> miles
            return unitToConvert*1760
        default:
            // mi -> mi
            return unitToConvert
        }
    }
        
            
        return unitToConvert
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input")) {
                TextField("Input Number Here", text: $inputUnit)
                    Picker("Input Unit", selection: $medInicial) {
                        ForEach(0..<units.count) {
                            Text("\(self.units[$0])")
                            }
                        }
                .pickerStyle(SegmentedPickerStyle() )
                }
                 Section(header: Text("Output")) {
                    Picker("Output Unit", selection: $medFinal) {
                        ForEach(0..<units.count) {
                           Text("\(self.units[$0])")
                           }
                       }
                    .pickerStyle(SegmentedPickerStyle() )

                    Text("\(conversion, specifier: "%.4g")")

                }

            }.navigationBarTitle("Length Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
