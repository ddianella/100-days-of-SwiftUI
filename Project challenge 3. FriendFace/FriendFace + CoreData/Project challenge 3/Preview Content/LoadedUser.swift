//
//  LoadedUser.swift
//  FriendFace with CoreData
//
//  Created by Prince$$ Di on 15.06.2021.
//

import Foundation
import SwiftUI

struct LoadedUser: Codable, Identifiable {
    var id: String?
    var isActive: Bool
    var name: String?
    var age: Int
    var company: String?
    var email: String?
    var address: String?
    var about: String?
    var friends: [LoadedFriend]
}

struct LoadedFriend: Codable, Identifiable {
    var id: String?
    var name: String?
}
