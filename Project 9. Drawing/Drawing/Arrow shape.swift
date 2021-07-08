//
//  Arrow shape.swift
//  Drawing
//
//  Created by Prince$$ Di on 09.04.2021.
//

import SwiftUI

struct Arrow: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY / 4))
        path.addLine(to: CGPoint(x: rect.maxX / 3, y: rect.maxY / 4))
        path.addLine(to: CGPoint(x: rect.maxX / 3, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX / 1.5, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX / 1.5, y: rect.maxY / 4))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY / 4))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) {
                value in
                Rectangle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [self.color(for: value, brightness: 1),
                                                                             self.color(for: value, brightness: 0.5)]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
                
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + self.amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
    
}



struct Arrow_shape: View {
    @State private var lineWidth = 5.0
    @State private var isShowBoldLine = false
    @State private var colorCycle = 0.0
    
    var body: some View {
        NavigationView {
            VStack {
                Arrow()
                    .stroke(Color.green, style: StrokeStyle(lineWidth: CGFloat(self.isShowBoldLine ? 20.0 : self.lineWidth), lineCap: .round, lineJoin: .round))
                    .frame(width: 150, height: 350)
                    .onTapGesture {
                        withAnimation {
                            self.isShowBoldLine.toggle()
                        }
                    }
                    .padding(.bottom, 50)
                
                ColorCyclingRectangle(amount: self.colorCycle)
                    .frame(width: 300, height: 300)
                
                Slider(value: $colorCycle)
                    .padding(.bottom, 50)
                
                
                
            }
        }
        
    }
}

struct Arrow_shape_Previews: PreviewProvider {
    static var previews: some View {
        Arrow_shape()
    }
}
