//
//  ScrollView effects using GeometryReader.swift
//  Project 18. Layout and geometry
//
//  Created by Prince$$ Di on 13.08.2021.
//

import SwiftUI

struct ScrollView_effects_using_GeometryReader: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

       var body: some View {
           GeometryReader { fullView in
               ScrollView(.vertical) {
                   ForEach(0..<50) { index in
                       GeometryReader { geo in
                           Text("Row #\(index)")
                               .font(.title)
                               .frame(width: fullView.size.width)
                               .background(self.colors[index % 7])
                            //center are rotated about 90 degrees
//                            .rotation3DEffect(.degrees(Double(geo.frame(in: .global).minY) / 5), axis: (x: 0, y: 1, z: 0))

                            .rotation3DEffect(.degrees(Double(geo.frame(in: .global).minY - fullView.size.height / 2) / 5), axis: (x: 0, y: 1, z: 0))
                       }
                       .frame(height: 40)
                   }
               }
           }
       }
}

struct ScrollView_effects_using_GeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView_effects_using_GeometryReader()
    }
}
