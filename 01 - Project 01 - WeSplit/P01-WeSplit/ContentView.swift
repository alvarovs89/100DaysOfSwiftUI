//
//  ContentView.swift
//  P01-WeSplit
//
//  Created by Alvaro Valdes Salazar on 12-07-20.
//  Copyright © 2020 Alvaro Valdes Salazar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
   private let tipPercentages = [0, 10, 15, 20, 25]
   private var totalPerPerson: Double {
        //Calcule the total per person here
        let peopleCount = Double(numberOfPeople) ?? 1
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    //CHALLENGE 2

    var totalAmount: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection

        return orderAmount + tipValue
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Picker("Number of people", selection: $numberOfPeople) {
                           ForEach(2..<100) {
                                Text("\($0) people")
                            }.navigationTitle("Number of People")
                        }
                    }
                    
//     **************     CHALLENGE 3 ****************
//                Section {
//                    TextField("NUMBER OF PEOPLE", text: $numberOfPeople)
//                        .keyboardType(.numberPad)
//                        }

//     **************   end of  CHALLENGE 3 ****************
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle() )
                }
                
                

               
                //CHALLENGE 1
                 Section(header: Text("Total with tip included:")) {
                    Text("$\(totalAmount, specifier: "%.2f")")
                        .foregroundColor(tipPercentage == 0 ? .red : .black)
                }


            } .navigationTitle("WeSplit")

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
