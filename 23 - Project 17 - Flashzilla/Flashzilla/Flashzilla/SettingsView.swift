//
//  SettingsView.swift
//  Flashzilla
//
//  Created by Alvaro Valdes Salazar on 16-07-21.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var timerTime : Int

    var body: some View {
        NavigationView {
            Form {
               
                Text("Hello, World!")
                Stepper(onIncrement: {
                    self.timerTime += 1
                }, onDecrement: {
                    self.timerTime -= 1
                }, label: { Text("Quantity \(timerTime)") })

            }
            .navigationBarTitle("Settings")
            .navigationBarItems(trailing: Button("Done", action: dismiss))
        }
    }
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(timerTime: .constant(50))
    }
}
