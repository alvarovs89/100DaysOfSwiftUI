//
//  ContentView.swift
//  iExpense
//
//  Created by Alvaro Valdes Salazar on 06-08-20.
//  Copyright © 2020 Alvaro Valdes Salazar. All rights reserved.
//

import SwiftUI
// with IDENTIFIABLE protocol, our expense items are now guaranteed to be identifiable uniquely, we no longer need to tell ForEach which property to use for the identifier – it knows there will be an id property and that it will be unique, because that’s the point of the Identifiable protocol.



struct fontStyleAmount: ViewModifier {
    let amount: Int
    func body(content: Content) -> some View {
        var font = Font.system(size: 17)
        var foregroundColor = Color.black
            if amount > 10 && amount < 100{
                foregroundColor = Color.blue
                 font = Font.system(size: 22)

        } else if   amount > 100 {
                foregroundColor = Color.red
                font = Font.system(size: 26)
            } else {
                foregroundColor = Color.black
                font = Font.system(size: 17)
        }

        return content
            .foregroundColor(foregroundColor)
            .font(font)

    }
}

extension View {
    func setStyleForAmount(_ amount: Int) -> some View {
        self.modifier(fontStyleAmount(amount: amount))
    }
}



struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount:Int
}

class Expenses :ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            print(" items\(items)")
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
    //1. Attempt to read the “Items” key from UserDefaults.
        if let items = UserDefaults.standard.data(forKey: "Items") {
  
    //2. Create an instance of JSONDecoder, which is the counterpart of JSONEncoder that lets us go from JSON data to Swift objects.
            let decoder = JSONDecoder()
     
    //3. Ask the decoder to convert the data we received from UserDefaults into an array of ExpenseItem objects.
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
               print("decoded \(decoded)")

    //4. If that worked, assign the resulting array to items and exit.
                self.items = decoded
                return
            }
        }
    //5. Otherwise, set items to be an empty array
        self.items = []
    }
}

struct ContentView: View {
    
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        NavigationView {
            List {
// thanks to Identifiable, forEachdoesn't need " id: \.id"
              ForEach(expenses.items) { item in
                    HStack {
                        VStack() {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text("$\(item.amount)")
                            .setStyleForAmount(item.amount)
                    }
                }
            .onDelete(perform: removeItems)
            }
        .navigationBarTitle("iExpense")
    
    //MARK: Challenge 1 ========
            .navigationBarItems(leading: EditButton(), trailing:
                Button(action: {
                    self.showingAddExpense = true
                }) {
                    Image(systemName: "plus")
                })
                .sheet(isPresented:$showingAddExpense) {
                    AddView(expenses: self.expenses)
            }
        }
    }
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
