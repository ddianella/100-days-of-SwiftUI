//
//  ContentView.swift
//  FriendFaceApp
//
//  Created by Prince$$ Di on 24.06.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var users = Users()
    
    var body: some View {
        NavigationView {
            List(users.arrayOfUsers) { user in
                NavigationLink(destination: DetailUserView(user: user, users: self.users)) {
                    HStack(alignment: .bottom, spacing: -15) {
                        Image(systemName: "person.crop.circle")
                            .foregroundColor(user.isActive ? .blue : .gray)
                            .font(.largeTitle)
                        
                        Text(user.checkIsActive)
                            .font(.caption2)
                        }
                    Text(user.name)
                        }
                    }
            .navigationBarTitle(Text("FriendFace"))
                }
            
            }
        }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
