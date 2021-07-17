//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Alvaro Valdes Salazar on 26-07-20.
//  Copyright © 2020 Alvaro Valdes Salazar. All rights reserved.
//

import SwiftUI



extension Image {
    func myImageModifier() -> some View {
        self
            .renderingMode(.original)
            .resizable()
            .frame(width: 80, height: 80)
            .cornerRadius(25)
            .overlay(RoundedRectangle(cornerRadius: 25)
             .stroke(Color.blue, lineWidth: 2))
            
    }
}


struct ContentView: View {
    private let allChoices = ["Rock", "Paper", "Scissors"]
    @State private var iaAnwser = Int.random(in: 0...2)
    @State private var userScore:Int = 0
    @State private var computerChoice:String = ""
    @State private var myChoice:String = ""

    @State private var showingScore = false
    @State private var resultGame:String = ""
    @State private var contador:Int = 0

    private let title = "Rock Paper Scissors \n The game"
    
    var body: some View {
        VStack {
            Text("\(title)")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            Spacer()
            Group {
                if contador != 0 {
                Text("The I.A. chose: \(allChoices[iaAnwser])")
                    Image(allChoices[iaAnwser])
                        .myImageModifier()
                } else {
                    Text("The I.A. haven't chose yet")
                }
            }
            Spacer()
            Text("You: \(resultGame)")
                .font(.title)

            Text("Your Score is: \(userScore)")
                .font(.title)

            Spacer()
            Text("Number of Games: \(contador)")
            Spacer()

            HStack {

                ForEach (0..<3) { number in
                    Button(action: {
                            self.theGame(number) // flag was tapped
                        self.contador += 1
                    }) {
                        Image(self.allChoices[number])
                        .myImageModifier()
                    }
                }
            }
        }.padding()
    }
    func theGame(_ number:Int) -> Void {
        self.myChoice = self.allChoices[number]
        iaAnwser = Int.random(in: 0..<self.allChoices.count)
        self.computerChoice = self.allChoices[iaAnwser]
        winOrLoose(myChoice, computerChoice)
     
        switch self.resultGame {
        case "Win":
            self.userScore += 1
        case "Lose":
            self.userScore -= 1
        default:
            return
        }
        
    }
    
    func winOrLoose(_ user: String,_ computer: String) {
        self.resultGame = ""
        if user == computer {
            self.resultGame = "Tie"
        }
        if(user == "Rock" && computer == "Scissors") {
            self.resultGame = "Win"
        }
        if(user == "Scissors" && computer == "Paper") {
            self.resultGame = "Win"
        }
        if(user == "Paper" && computer == "Rock") {
            self.resultGame = "Win"
        }
        if(self.resultGame != "Win" && self.resultGame != "Tie") {
            self.resultGame = "Lose"
        }

    }
}



struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
    Group {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
        }
    }
}
