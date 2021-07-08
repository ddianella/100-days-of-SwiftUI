//
//  User.swift
//  FriendFaceApp
//
//  Created by Prince$$ Di on 24.06.2021.
//

import Foundation
import SwiftUI

struct User: Codable, Identifiable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    //var registered: Date
    //var tags: [String]
    var friends: [Friend]
    
    var checkIsActive: String {
        return self.isActive ? "🟢" : "🔴"
    }
}

struct Friend: Codable, Identifiable {
    var id: String
    var name: String
}
