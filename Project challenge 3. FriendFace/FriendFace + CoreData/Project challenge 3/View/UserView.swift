//
//  UserView.swift
//  FriendFace with CoreData
//
//  Created by Prince$$ Di on 15.06.2021.
//

import SwiftUI

struct UserView: View {
    
    @State private var isShowFriendList = false
    
    var user: User
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName:"person.circle")
                    .font(.system(size: 90))
                    .offset(x: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/, y: 0)
                    .foregroundColor(user.isActive ? .blue : .gray)
                Text(user.checkIsActive)
                    .offset(x: -35.0, y: 30.0)
            }
            Form {
                Section(header: Text("Name")) {
                    Text(user.wrappedName)
                }
                Section(header: Text("Age")) {
                    Text("\(user.wrappedAge)")
                }
                Section(header: Text("Company")) {
                    Text(user.wrappedCompany)
                }
//                Section(header: Text("Is Activity")) {
//                    Text(user.checkIsActive)
//                }
                
                Section(header: Text("Switch to show friends")) {
                    Toggle(isOn: $isShowFriendList) {
                        Text("Show \(user.wrappedName)'s friend")
                    }
                }
                if isShowFriendList {
                    Section(header: Text("\(user.wrappedName)'s friends")) {
                        NavigationLink(destination: FriendsListView(friends: self.user.friendsArray)) {
                            Text("Show \(user.wrappedName)'s friends")
                        }
                    }
                }
            }
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: User())
    }
}
