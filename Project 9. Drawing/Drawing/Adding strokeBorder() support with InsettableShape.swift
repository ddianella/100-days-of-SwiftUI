//
//  Adding strokeBorder() support with InsettableShape.swift
//  Drawing
//
//  Created by Prince$$ Di on 08.04.2021.
//

import SwiftUI

struct Arc2: Shape, InsettableShape {
    var insetAmount: CGFloat = 0
    
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }

}


struct Adding_strokeBorder___support_with_InsettableShape: View {
    var body: some View {
        Arc2(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
            .strokeBorder(Color.blue, lineWidth: 40)
    }
}

struct Adding_strokeBorder___support_with_InsettableShape_Previews: PreviewProvider {
    static var previews: some View {
        Adding_strokeBorder___support_with_InsettableShape()
    }
}
