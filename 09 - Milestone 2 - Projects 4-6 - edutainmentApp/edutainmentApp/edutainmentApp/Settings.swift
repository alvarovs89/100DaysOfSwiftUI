//
//  Settings.swift
//  edutainmentApp
//
//  Created by Alvaro Valdes Salazar on 30-08-20.
//  Copyright © 2020 Alvaro Valdes Salazar. All rights reserved.
//

import SwiftUI

struct Settings: View {
    @State var multiplicationTable = 1
    private var questionsRange = ["5","10", "15", "20", "all"]
    @State var numberOfQuestions = 0

    var body: some View {
        VStack {
            NavigationView {
        //MARK: Settings

                Form {
                    Section(header: Text("Select what table do you want")) {
                        Stepper("\(multiplicationTable) Times Table", value: $multiplicationTable, in: 1...12)
                    }

                    Section(header: Text("Select how many question you want")) {
                        Picker("Select how many question you want",selection: $numberOfQuestions) {
                                ForEach(0..<questionsRange.count) {
                                    Text("\(self.questionsRange[$0])")
                                    
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle() )
                    }
                    Section(header: Text("Select how many question you want")) {
                        Button("Start the game") {
                            // more code to add
                            ContentView()
                        }
                    }
                }
        .navigationBarTitle("Multiplication")
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
