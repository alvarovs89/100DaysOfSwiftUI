//
//  ContentView4.swift
//  Drawing
//
//  Created by Alvaro Valdes Salazar on 26-08-20.
//  Copyright © 2020 Alvaro Valdes Salazar. All rights reserved.
//

import SwiftUI

struct ContentView4: View {
    var body: some View {
        VStack {
            Text("Hello World")
                .frame(width: 150, height: 150)
                .background(
                Image("Example")
                    .resizable()
                    .frame(width: 100, height: 100)
            )
            
            Spacer()
            
//  The type is called ImagePaint, and it’s created using one to three parameters. At the very least you need to give it an Image to work with as its first parameter, but you can also provide a rectangle within that image to use as the source of your drawing specified in the range of 0 to 1 (the second parameter), and a scale for that image (the third parameter). Those second and third parameters have sensible default values of “the whole image” and “100% scale”, so you can sometimes ignore them.
//
//  As an example, we could render an example image using a scale of 0.2, which means it’s shown at 1/5th the normal size:
            
            Text("Hello World")
            .frame(width: 150, height: 150)
            .border(ImagePaint(image: Image("Example"), scale: 0.15), width: 20)
            Spacer()


// If you want to try using the sourceRect parameter, make sure you pass in a CGRect of relative sizes and positions: 0 means “start” and 1 means “end”. For example, this will show the entire width of our example image, but only the middle half:
            
            Text("Hello World")
            .frame(width: 300, height: 300)
                .border(ImagePaint(image: Image("Example"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.1), width: 30)

//It’s worth adding that ImagePaint can be used for view backgrounds and also shape strokes. For example, we could create a capsule with our example image tiled as its stroke
            
            Capsule()
            .strokeBorder(ImagePaint(image: Image("Example"), scale: 0.1), lineWidth: 20)
            .frame(width: 300, height: 200)

        }
    }
}

struct ContentView4_Previews: PreviewProvider {
    static var previews: some View {
        ContentView4()
    }
}
