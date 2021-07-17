//
//  02ScrollViewAndScrollingData.swift
//  Moonshot
//
//  Created by Alvaro Valdes Salazar on 09-08-20.
//  Copyright © 2020 Alvaro Valdes Salazar. All rights reserved.
//


//when we add views to a scroll view they get created immediately.
import SwiftUI

struct CustomText: View {
    var text: String

    var body: some View {
        Text(text)
    }

    init(_ text: String) {
        print("Creating a new CustomText ")
        self.text = text
    }
}
struct _2ScrollViewAndScrollingData: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)

                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct _2ScrollViewAndScrollingData_Previews: PreviewProvider {
    static var previews: some View {
        _2ScrollViewAndScrollingData()
    }
}
