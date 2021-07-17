//
//  ContentView.swift
//  edutainmentApp
//
//  Created by Alvaro Valdes Salazar on 05-08-20.
//  Copyright © 2020 Alvaro Valdes Salazar. All rights reserved.
//

import SwiftUI

struct buttonAns: ViewModifier {
    var imageName: String

    func body(content: Content) -> some View {
        HStack {
            Image(imageName)
            content
                .font(.largeTitle)
                .foregroundColor(.blue)
                .frame(width: 200, height: 50, alignment: .center)
        }
    }
}

//extension View {
//    func buttonAnswer() -> some View {
//        self.modifier(buttonAns(imageName: str))
//    }
//}

struct ContentView: View {
    
    @State private var imagesName = ["parrot", "duck", "dog", "horse", "rabbit", "whale", "rhino", "elephant", "zebra", "chicken", "cow", "panda", "hippo", "gorilla", "owl", "penguin", "sloth", "frog", "narwhal", "buffalo", "monkey", "giraffe", "moose", "pig", "snake", "bear", "chick", "walrus", "goat", "crocodile"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
//    private var randomAnimal = Int.random(in: 0..29)
    @State var multiplicationTable = 1
    private var questionsRange = ["5","10", "15", "20", "all"]
    @State var numberOfQuestions = 0


    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
//                NavigationView {

//MARK: Settings


//MARK: The Game

                VStack (spacing: 20) {
                    Spacer()
                    Text("Cuanto Es ")
                        .font(.largeTitle)
                    Spacer()
                    ForEach(0..<4) { number in
                        Button(action:{
                            //action
                        }) {
                            HStack {
                                Image(self.imagesName[number])
                                    .renderingMode(.original)
                                    .scaleEffect(0.5)
                                    .frame(width: 80, height: 80)
                                Text("Question x,x")
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    Spacer()
                }
            }
        }
    }
func theGame()  {
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
