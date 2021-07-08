//
//  Creating custom paths with SwiftUI.swift
//  Drawing
//
//  Created by Prince$$ Di on 08.04.2021.
//

import SwiftUI

struct Creating_custom_paths_with_SwiftUI: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
        }
       // .fill(Color.blue)
       // .stroke(Color.blue.opacity(0.50), lineWidth: 10)
        
        //round створює плавноо округлі форми
        .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
    }
}

struct Creating_custom_paths_with_SwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Creating_custom_paths_with_SwiftUI()
        }
    }
}
