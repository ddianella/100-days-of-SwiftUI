//
//  Shapes in SwiftUI_Arc.swift
//  Drawing
//
//  Created by Prince$$ Di on 08.04.2021.
//

import SwiftUI

struct Arc: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    //    func path(in rect: CGRect) -> Path {
    //        var path = Path()
    //        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
    //
    //        return path
    //   }
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        
        return path
    }
}

struct Shapes_in_SwiftUI_Arc: View {
    var body: some View {
        Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
            .stroke(Color.blue, lineWidth: 10)
            .frame(width: 300, height: 300)
    }
}

struct Shapes_in_SwiftUI_Arc_Previews: PreviewProvider {
    static var previews: some View {
        Shapes_in_SwiftUI_Arc()
    }
}
