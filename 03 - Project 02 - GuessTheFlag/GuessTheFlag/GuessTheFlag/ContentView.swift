//
//  ContentView.swift
//  P02-GuessTheFlag
//
//  Created by Alvaro Valdes Salazar on 14-07-20.
//  Copyright © 2020 Alvaro Valdes Salazar. All rights reserved.
//

import SwiftUI


struct flagImage: View {
    var imagesName: String
    var body:some View {
        Image(imagesName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black,lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}

struct ContentView: View {
    let labels = [
        "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
        "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
        "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
        "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
        "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
        "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
        "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
        "Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
        "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
    ]
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
     //MARK:  Score variables
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var userScore = 0
    @State private var scoreMessage = ""
    
    //MARK: Animation variables
    @State private var opacityAmount = 1.0
    @State private var rotationAmount = 0.0


    //MARK:  flagImage for day 24


    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack (spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                    .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                    

                }
                ForEach (0..<3) { number in
                    Button(action: {
                        self.flagTapped(number) // flag was tapped
                        self.opacityAmount = 0.25

                    }) {
                        flagImage(imagesName: self.countries[number])
                            .accessibility(label: Text(self.labels[self.countries[number], default: "Unknown flag"]))
                    }
                        .opacity(number == self.correctAnswer ? 1 : self.opacityAmount)
                    .rotation3DEffect(.degrees(number == self.correctAnswer ? self.rotationAmount : 0 ), axis: (x: 0, y: 1, z: 0))
                }
                Text("Your Score is: \(userScore)")
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("\(scoreMessage)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
                })
        }
    }
    
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            rotationAmount = 0.0

        withAnimation(.interpolatingSpring(stiffness: 20, damping: 5)) {
            self.rotationAmount += 360
        }
            // Score
            userScore += 1
           scoreMessage = "Your score is \(userScore)"
            
        } else {
        scoreTitle = "Wrong"
        scoreMessage = "Sorry that flag is from \(countries[number])"

        }
        showingScore = true
    }
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        //Animation
        withAnimation(.easeInOut) {
            self.opacityAmount = 1.0
        }
            self.rotationAmount = 0.0
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
