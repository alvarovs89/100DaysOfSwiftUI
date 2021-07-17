//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Alvaro Valdes Salazar on 09-09-20.
//  Copyright © 2020 Alvaro Valdes Salazar. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
 
    //challenge 2
    @State private var alertTitle = ""
    //challenge 2 end

    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image("cupcakes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    
                    Text("Your total is $\(self.order.cost, specifier: "%.2f")")
                        .font(.title)
                    
                    Button("Place order") {
                        self.placeOrder()
                    }
                .padding()
                }
            }
        }
        .navigationBarTitle("Check out", displayMode: .inline)
        .alert(isPresented: $showingConfirmation) {
            Alert(title: Text(alertTitle), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
        }
    }
// https://www.hackingwithswift.com/books/ios-swiftui/sending-and-receiving-orders-over-the-internet
    func placeOrder () {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
    
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
        //challenge 2 pat.1

                self.alertTitle = "\(error?.localizedDescription ?? "Error")"
                self.confirmationMessage = "Esta mala la wea"
                self.showingConfirmation = true
        //challenge 2 end

                return
            }
            
            if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
        
        //challenge 2 pat.2
                self.alertTitle = "\(error?.localizedDescription ?? "Thank you!")"
        //challenge 2 end

                self.confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
                self.showingConfirmation = true
            } else {
                print("Invalid response from server")
            }
        }.resume()

    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
