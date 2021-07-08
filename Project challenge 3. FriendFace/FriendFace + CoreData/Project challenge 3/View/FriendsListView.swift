//
//  FriendsListView.swift
//  FriendFace with CoreData
//
//  Created by Prince$$ Di on 15.06.2021.
//

import SwiftUI

struct FriendsListView: View {
    
    
    
    var friends: [Friend]
    
    var body: some View {
        List() {
            ForEach(friends, id: \.wrappedId) { friend in
                
                NavigationLink(destination: DetailUserView(userId: friend.wrappedId)) {
                    VStack(alignment: .leading, spacing: nil) {
                        Text(friend.wrappedName)
                    }
                }
            }
        }
    }
    
}
