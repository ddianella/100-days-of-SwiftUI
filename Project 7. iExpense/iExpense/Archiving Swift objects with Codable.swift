//
//  Archiving Swift objects with Codable.swift
//  iExpense
//
//  Created by Prince$$ Di on 15.04.2021.
//

import SwiftUI

struct User: Codable {
    var firstName: String
    var lastName: String
}

struct Archiving_Swift_objects_with_Codable: View {
    
    @State private var user = User(firstName: "Diana", lastName: "Domoslavska")
    
    var body: some View {
        //Кнопка, яка архівує користувача і зберігає його в UserDefaults
        Button("Save User") {
            let encoder = JSONEncoder()

            if let data = try? encoder.encode(self.user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct Archiving_Swift_objects_with_Codable_Previews: PreviewProvider {
    static var previews: some View {
        Archiving_Swift_objects_with_Codable()
    }
}
