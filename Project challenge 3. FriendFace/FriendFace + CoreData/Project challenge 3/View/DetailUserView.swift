//
//  DetailUserView.swift
//  FriendFace with CoreData
//
//  Created by Prince$$ Di on 15.06.2021.
//

import SwiftUI

struct DetailUserView: View {
    
    
    
    var fetchRequest: FetchRequest<User>
    var user: User? { fetchRequest.wrappedValue.first }
    
    
    var body: some View {
        VStack {
            UserView(user: user!)
            
        }
    }
    
    init(userId: String) {
        fetchRequest = FetchRequest<User>(entity: User.entity(), sortDescriptors: [], predicate: NSPredicate(format: "%K == %@", "id", userId))
    }
}
