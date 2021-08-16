//
//  ContentView.swift
//  Project 18. Layout and geometry
//
//  Created by Prince$$ Di on 13.08.2021.
//

import SwiftUI

extension VerticalAlignment {
    struct MidAccountAndName: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.top]
        }
    }

    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct CustomAlignmentGuide: View {
    var body: some View {
        HStack(alignment: .midAccountAndName) {
                    VStack {
                        Text("@d_dianella")
                            .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                        Image("diana")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                           
                            .frame(width: 64, height: 64)
                    }

                    VStack {
                        Text("Full name:")
                        Text("DIANA DOMOSLAVSKA")
                            .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                                       .font(.largeTitle)
                    }
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlignmentGuide()
    }
}
