//
//  IsContactedImage.swift
//  Project 16. HotProspects
//
//  Created by Prince$$ Di on 11.08.2021.
//

import SwiftUI

struct IsContactedImage: View {
    
    var isContacted: Bool
    
    var body: some View {
        Image(systemName: isContacted ? "person.crop.circle.badge.checkmark" : "person.crop.circle.badge.questionmark")
            .font(.system(size: 30))
            .foregroundColor(isContacted ? .green : .gray)
    }
}

//struct IsContacted_Previews: PreviewProvider {
//    static var previews: some View {
//        IsContactedImage()
//    }
//}
