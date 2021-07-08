//
//  Creative borders and fills using ImagePaint.swift
//  Drawing
//
//  Created by Prince$$ Di on 08.04.2021.
//

import SwiftUI

struct Creative_borders_and_fills_using_ImagePaint: View {
    var body: some View {
//        Text("Hello, World!")
//            .frame(width: 300, height: 300)
            
            //.background(Image("abstract").resizable())
            
            //.border(ImagePaint(image: Image("abstract"), scale: 0.5), width: 30)
        
        // this will show the entire width of our example image, but only the middle half - це покаже всю ширину нашого прикладу зображення, але лише середню половину
//            .border(ImagePaint(image: Image("abstract"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.8), width: 30)
        
        //create a capsule with our example image tiled as its stroke - створює капсулу з нашим прикладом зображення, викладеного як обведення
        Capsule()
            .strokeBorder(ImagePaint(image: Image("abstract"), scale: 0.5), lineWidth: 30)
            .frame(width: 300, height: 200)

            
            
    }
}

struct Creative_borders_and_fills_using_ImagePaint_Previews: PreviewProvider {
    static var previews: some View {
        Creative_borders_and_fills_using_ImagePaint()
    }
}
