//
//  Blend modes .swift
//  Drawing
//
//  Created by Prince$$ Di on 08.04.2021.
//

import SwiftUI

struct Blend_modes_: View {
    var body: some View {
        ZStack {
            Image("Diana")

            Rectangle()
                .fill(Color.purple)
                .blendMode(.screen)
        }
        .frame(width: 400, height: 500)
        .clipped()
        
//        Image("Diana")
//                .colorMultiply(.purple)
    }
}

struct Blend_modes__Previews: PreviewProvider {
    static var previews: some View {
        Blend_modes_()
    }
}
