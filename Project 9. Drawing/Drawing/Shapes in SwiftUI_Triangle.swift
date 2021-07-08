//
//  Shapes in SwiftUI_Rectangle.swift
//  Drawing
//
//  Created by Prince$$ Di on 08.04.2021.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct Shapes_in_SwiftUI_Triangle: View {
    var body: some View {
        Triangle()
            //.fill(Color.red)
            .stroke(Color.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .frame(width: 300, height: 300)
    }
}

struct Shapes_in_SwiftUI_Triangle_Previews: PreviewProvider {
    static var previews: some View {
        Shapes_in_SwiftUI_Triangle()
    }
}
