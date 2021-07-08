//
//  Friend+CoreDataProperties.swift
//  FriendFace with CoreData
//
//  Created by Prince$$ Di on 15.06.2021.
//
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: String?
    @NSManaged public var user: User?
    
    
    public var wrappedId: String {
        id ?? "Unknown Id"
    }
    
    public var wrappedName: String {
        name ?? "Unknown Name"
    }

}
