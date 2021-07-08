//
//  DetailUserView.swift
//  FriendFaceApp
//
//  Created by Prince$$ Di on 24.06.2021.
//

import SwiftUI

struct DetailUserView: View {
    var user: User
    var users: Users
    @State private var isShowFriendList = true
    
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
            Text(user.name)
                .font(.title)
                .fontWeight(.semibold)
            Text("\(user.age)")
            
            Form {
                Section(header: Text("About")) {
                    Text(user.about)
                }
                Section(header: Text("Email")) {
                    Text(user.email)
                }
                Section(header: Text("Company")) {
                    Text(user.company)
                }
                if isShowFriendList {
                Section(header: Text("Friends")) {
                            NavigationLink(destination: FriendsListView(users: self.users, user: self.user)) {
                                Text("Show \(user.name)'s friends")
                            }
                        }
                    }
                    //                                            Toggle(isOn: $isShowFriendList) {
                    //                                                Text("Show \(user.name)'s friend")
                    //                                            }
                }
                
            }
        }
        
    }

struct DetailUserView_Previews: PreviewProvider {
    static var previews: some View {
        DetailUserView(user: User(id: "ID", isActive: true, name: "Name", age: 23, company: "Company", email: "@gmail.com", address: "Kozatska", about: "About", friends: [Friend]()),users: Users())
    }
}

