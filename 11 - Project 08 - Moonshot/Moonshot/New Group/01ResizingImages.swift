//
//  01ResizingImages.swift
//  Moonshot
//
//  Created by Alvaro Valdes Salazar on 09-08-20.
//  Copyright © 2020 Alvaro Valdes Salazar. All rights reserved.
//

import SwiftUI

struct _1ResizingImages: View {
    var body: some View {
        VStack {
            GeometryReader { geo in
                Image("2")
                .resizable()
                .aspectRatio(contentMode: .fit) // .fit or .fill
                    .frame(width: geo.size.width)
            }
        }
    }
}

struct _1ResizingImages_Previews: PreviewProvider {
    static var previews: some View {
        _1ResizingImages()
    }
}
