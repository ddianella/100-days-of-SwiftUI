//
//  Storing user settings with UserDefaults.swift
//  iExpense
//
//  Created by Prince$$ Di on 15.04.2021.
//

import SwiftUI

struct Storing_user_settings_with_UserDefaults: View {
   // @State private var tapCount = 0
    
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    var body: some View {
        
        Button("Tap count: \(tapCount)") {
            self.tapCount += 1
            UserDefaults.standard.set(self.tapCount, forKey: "Tap")
            //метод set() приймає будь-який тип даних - цілі числа, логічні значення, рядки тощо
        }
    }
}

struct Storing_user_settings_with_UserDefaults_Previews: PreviewProvider {
    static var previews: some View {
        Storing_user_settings_with_UserDefaults()
    }
}
