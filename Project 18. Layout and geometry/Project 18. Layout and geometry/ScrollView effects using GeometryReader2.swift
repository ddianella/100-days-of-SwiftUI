//
//  ScrollView effects using GeometryReader2.swift
//  Project 18. Layout and geometry
//
//  Created by Prince$$ Di on 13.08.2021.
//

import SwiftUI

struct ScrollView_effects_using_GeometryReader2: View {
    
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
            GeometryReader { fullView in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<50) { index in
                            GeometryReader { geo in
                                Rectangle()
                                    .fill(self.colors[index % 7])
                                    .frame(height: 150)
                                    .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).midX - fullView.size.width / 2) / 10), axis: (x: 0, y: 1, z: 0))
                            }
                            .frame(width: 150)
                        }
                    }
                    .padding(.horizontal, (fullView.size.width - 150) / 2)
                }
            }
//            .edgesIgnoringSafeArea(.all)
        }
}

struct ScrollView_effects_using_GeometryReader2_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView_effects_using_GeometryReader2()
    }
}
