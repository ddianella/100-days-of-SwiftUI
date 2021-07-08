//
//  User+CoreDataProperties.swift
//  FriendFace with CoreData
//
//  Created by Prince$$ Di on 15.06.2021.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }
    
    @NSManaged public var name: String?
    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var company: String?
    @NSManaged public var age: Int16
    @NSManaged public var friends: NSSet?

    
    
    public var wrappedId: String {
        id ?? "Unknown Id"
    }
    
    public var wrappedName: String {
        name ?? "Unknown Name"
    }
    
    public var wrappedCompany: String {
        company ?? "Unknown Company"
    }
    
    public var wrappedAge: Int16 {
        age
    }
    
    public var wrappedIsActive: Bool {
        isActive
    }
    
    public var checkIsActive: String {
        return isActive ? "🟢" :"🔴"
    }

    public var friendsArray: [Friend] {
        let set = friends as? Set<Friend> ?? []
        return set.sorted { $0.name! < $1.name!}
    }
}


//    @NSManaged public var id: String?
//    @NSManaged public var isActive: Bool
//    @NSManaged public var name: String?
//    @NSManaged public var age: Int16
//    @NSManaged public var company: String?
//    @NSManaged public var email: String?
//    @NSManaged public var address: String?
//    @NSManaged public var about: String?
//    @NSManaged public var friends: NSSet?
//
//    public var wrappedId: String {
//        id ?? "Unknown Id"
//    }
//
//    public var wrappedIsActive: Bool {
//        isActive
//    }
//
//    public var checkIsActive: String {
//        return isActive ? "🟢" : "🔴"
//    }
//
//    public var wrappedName: String {
//        name ?? "Unknown Name"
//    }
//
//    public var wrappedAge: Int16 {
//        age
//    }
//
//    public var wrappedCompany: String {
//        company ?? "Unknown Company"
//    }
//
//    public var wrappedEmail: String {
//        email ?? "Unknown Email"
//    }
//
//    public var wrappedAddress: String {
//        address ?? "Unknown Address"
//    }
//
//    public var wrappedAbout: String {
//        about ?? "Unknown About"
//    }
//
//    public var friendsArray: [Friend] {
//        let set = friends as? Set<Friend> ?? []
//        return set.sorted { $0.name! < $1.name! }
//    }

//}

// MARK: Generated accessors for friends
extension User {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: Friend)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: Friend)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}
