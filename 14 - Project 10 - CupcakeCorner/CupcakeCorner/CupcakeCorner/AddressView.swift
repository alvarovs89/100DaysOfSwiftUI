//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Alvaro Valdes Salazar on 09-09-20.
//  Copyright © 2020 Alvaro Valdes Salazar. All rights reserved.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    

    var body: some View {
        Form {
            Section{
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            Section {
                NavigationLink(destination:CheckoutView(order: order)) {
                    Text("Check out")
                }
            }
            .disabled(order.hasValidAddress == false)
        }
        .navigationBarTitle("Delivery details", displayMode: .inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
