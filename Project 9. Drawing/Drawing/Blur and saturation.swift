//
//  Blur and saturation.swift
//  Drawing
//
//  Created by Prince$$ Di on 08.04.2021.
//

import SwiftUI

struct Blur_and_saturation: View {
    @State private var amount: CGFloat = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                Image("Diana")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(CGSize(width: 2.0, height: 2.0))
                    .clipShape(Circle())
                    .frame(width: 400, height: 400)
                    
                    
                    .saturation(Double(amount))
                    .blur(radius: (1 - amount) * 20)
            }
            .frame(width: 300, height: 300)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct Blur_and_saturation_Previews: PreviewProvider {
    static var previews: some View {
        Blur_and_saturation()
    }
}
