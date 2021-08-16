//
//  Absolute positioning for SwiftUI views.swift
//  Project 18. Layout and geometry
//
//  Created by Prince$$ Di on 13.08.2021.
//

import SwiftUI

struct Absolute_positioning_for_SwiftUI_views: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .offset(x: 50, y: 50)
                .background(Color.red)
            
            Text("Hello, World!")
                .background(Color.red)
                .position(x: 100, y: 100)
            
            Text("Hello, World!")
                .position(x: 100, y: 100)
                .background(Color.red)
        }
    }
}

struct Absolute_positioning_for_SwiftUI_views_Previews: PreviewProvider {
    static var previews: some View {
        Absolute_positioning_for_SwiftUI_views()
    }
}
