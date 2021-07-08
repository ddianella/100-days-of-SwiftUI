//
//  ContentView.swift
//  Project challenge 3
//
//  Created by Prince$$ Di on 08.06.2021.
//

import SwiftUI
import CoreData


struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(entity: User.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var users: FetchedResults<User>
    
    
    @State private var isShowFriendList = false
    var body: some View {
        NavigationView {
            List() {
                ForEach(users, id: \.id) { user in
                    
                    NavigationLink(destination: DetailUserView(userId: user.wrappedId)) {
                        HStack(alignment: .bottom, spacing: -15) {
                            Image(systemName: "person.crop.circle")
                                .foregroundColor(user.isActive ? .blue : .gray)
                                .font(.largeTitle)
                            
                            Text(user.checkIsActive)
                                .font(.caption2)
                        }
                        VStack(alignment: .leading) {
                            Text(user.wrappedName)
                            Text("Age: \(user.age)")
                                .font(.caption)
                        }
                    }
                }
                .onDelete(perform: removeUser(at:))
            }
            .navigationBarTitle(Text("UsersList + CoreData"), displayMode: .inline)
            
        }
        .onAppear {
            if self.users.isEmpty {
                print("Users is empty \(self.users)")
                Users.loadDataToCD(moc: self.moc)
            }
            
        }
    }
    
    func removeUser(at offsets: IndexSet) {
        for index in offsets {
            let user = users[index]
            moc.delete(user)
            
            do {
                try moc.save()
            } catch {
                print("Error save after delete")
            }
            
        }
        //                for all in users {
        //                    moc.delete(all)
        //
        //                }
        //                try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
