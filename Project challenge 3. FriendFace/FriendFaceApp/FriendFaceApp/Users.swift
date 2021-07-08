//
//  Users.swift
//  FriendFaceApp
//
//  Created by Prince$$ Di on 24.06.2021.
//

import Foundation
import SwiftUI

class Users: ObservableObject {
    @Published var arrayOfUsers = [User]()
    
    init() {
        let stringUrl = "https://www.hackingwithswift.com/samples/friendface.json"
        
        guard let url = URL(string: stringUrl) else { return }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data in response \(error?.localizedDescription ?? "No data response")")
            return
            }
            if let decoderUser = try? JSONDecoder().decode([User].self, from: data) {
                self.arrayOfUsers = decoderUser
            }
        } .resume()
    }
    
    func findUser(string: String) -> User {
        guard let firstUser = self.arrayOfUsers.first(where: { (oneUser) -> Bool in
            oneUser.id == string
    }) else {
            return self.arrayOfUsers.first!
        }
        return firstUser
    }
}
