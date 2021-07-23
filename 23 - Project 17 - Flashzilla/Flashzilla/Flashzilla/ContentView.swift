//
//  ContentView.swift
//  Flashzilla
//
//  Created by Alvaro Valdes Salazar on 13-07-21.
//

import SwiftUI


extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = CGFloat(total - position)
        return self.offset(CGSize(width: 0, height: offset*10))
    }
}


struct ContentView: View {
//    @State private var cards = [Card](repeating: Card.example, count: 10)
    
    @State private var cards = [Card]()
    
    @State var timerTime: Int = 50

    
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor

    @Environment(\.accessibilityEnabled) var accessibilityEnabled

    @State private var isActive = true
    
    //MARK: - DSFSD

    @State private var timeRemaining : Int = 50
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    @State private var showingEditScreen = false
    @State private var showingSettingsScreen = false

    
    var body: some View {
        ZStack {
            Image(decorative: "background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            
            VStack {

  //MARK: - Timer
                Text("Time: \(timeRemaining)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(
                        Capsule()
                            .fill(Color.black)
                            .opacity(0.75)
                    )
                
                
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: self.cards[index]) {
                            withAnimation {
                                self.removeCard(at: index)
                            }
                        }
                            .stacked(at: index, in: self.cards.count)
                        .allowsHitTesting(index == self.cards.count-1)
                        .accessibility(hidden: index < self.cards.count - 1)

                    }
                    
                }
                .allowsHitTesting(timeRemaining > 0)
                
                
                if cards.isEmpty {
                    Button("Start Again", action: resetCards)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .clipShape(Capsule())
                }

            }
    //MARK: - BUTTON add new
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        self.showingSettingsScreen = true
                    }) {
                        Image(systemName: "gear")
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .clipShape(Circle())
                    }
                    Spacer()
                    Spacer()

                    Button(action: {
                        self.showingEditScreen = true
                    }) {
                        Image(systemName: "plus.circle")
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .clipShape(Circle())
                    }

                    Spacer()

                }

                Spacer()

            }
            .foregroundColor(.white)
            .font(.largeTitle)
            .padding()
            
            if differentiateWithoutColor || accessibilityEnabled {
                VStack {
                    Spacer()

                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                self.removeCard(at: self.cards.count - 1)
                                
                            }
                        }) {
                            Image(systemName: "xmark.circle")
                                .padding()
                                .background(Color.black.opacity(0.7))
                                .clipShape(Circle())
                        }
                        .accessibility(label: Text("Wrong"))
                        .accessibility(hint: Text("Mark your answer as being incorrect."))
                        
                        Spacer(minLength: 480)
                    
                        Button(action: {
                            withAnimation {
                                self.removeCard(at: self.cards.count - 1)
                                
                            }
                        }) {
                            Image(systemName: "checkmark.circle")
                                .padding()
                                .background(Color.black.opacity(0.7))
                                .clipShape(Circle())
                        }
                        .accessibility(label: Text("Correct"))
                        .accessibility(hint: Text("Mark your answer as being correct."))
                        Spacer()

                    }
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                    
                }
            }
            
//MARK: - CHALLENGE 1  - Day 86 - Make something interesting for when the timer runs out. At the very least make some text appear, but you should also try designing a custom haptic using Core Haptics.

            if self.timeRemaining == 0 {
                ZStack {
                    Color.black
                    VStack {
                        Text("Time Over")
                            .font(.largeTitle)
                            .padding(20)
                            .background(
                                Capsule()
                                    .fill(Color.red)
                                    .opacity(0.75)
                            )
                
                        Button("Start Again", action: resetCards)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .clipShape(Capsule())
                    
                            .animation(.easeInOut)
                    }
                }
            }

        }
// ===
        .onReceive(timer) { time in
            guard self.isActive else { return }
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            self.isActive = false
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            if self.cards.isEmpty == false {
                self.isActive = true

            }
        }
        .sheet(isPresented: $showingEditScreen, onDismiss: resetCards) {
            EditCards()
            
        }
        .sheet(isPresented: $showingSettingsScreen, onDismiss: resetCards) {
            SettingsView(timerTime: $timerTime)
            
        }
        .onAppear(perform: resetCards)
    }
    //MARK: - Functions
    
    func removeCard(at index: Int) {
        guard index >= 0 else { return }
        cards.remove(at: index)
        
        if cards.isEmpty {
            isActive = false
        }
    }
    func resetCards() {
//        cards = [Card](repeating: Card.example, count: 10)
        timeRemaining = timerTime
        isActive = true
        loadData()

    }
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                self.cards = decoded
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}

