//
//  Understanding frames and coordinates inside GeometryReader.swift
//  Project 18. Layout and geometry
//
//  Created by Prince$$ Di on 13.08.2021.
//

import SwiftUI

struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            InnerView()
                .background(Color.green)
            Text("Bottom")
        }
    }
}

struct InnerView: View {
    var body: some View {
        HStack {
            Text("Left")
            GeometryReader { geo in
                Text("Center")
                    .background(Color.blue)
                    .onTapGesture {
                        print("Global center: \(geo.frame(in: .global).midX) x \(geo.frame(in: .global).midY)")
                        print("Custom center: \(geo.frame(in: .named("Custom")).midX) x \(geo.frame(in: .named("Custom")).midY)")
                        print("Local center: \(geo.frame(in: .local).midX) x \(geo.frame(in: .local).midY)")
                    }
            }
            .background(Color.orange)
            Text("Right")
        }
    }
}

struct Understanding_frames_and_coordinates_inside_GeometryReader: View {
    var body: some View {
        OuterView()
            .background(Color.red)
            .coordinateSpace(name: "Custom")
    }
}

//struct Understanding_frames_and_coordinates_inside_GeometryReader: View {
//    var body: some View {
//        VStack {
//            GeometryReader { geo in
//                Text("Hello, World!")
//                    .frame(width: geo.size.width * 0.9, height: 40)
//                    .background(Color.red)
//            }
//            .background(Color.green)
//
//            Text("More text")
//                .background(Color.blue)
//        }
//    }
//}

struct Understanding_frames_and_coordinates_inside_GeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        Understanding_frames_and_coordinates_inside_GeometryReader()
    }
}
