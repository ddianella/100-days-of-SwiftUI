//
//  ContentView.swift
//  Project challenge 3
//
//  Created by Prince$$ Di on 08.06.2021.
//

import SwiftUI

struct User: Decodable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
//    let registered: Date
    let tags: [String]
    let friends: [Friend]
    
    struct Friend: Decodable {
        let id: String
        let name: String
    }
}

struct DetailFriendsView {
    var user: User
    var body: some View {
        Text(user.name)
    }
}
struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.id) { item in
                    NavigationLink(destination: Text("DetailView")) {
                        HStack() {
                            HStack(alignment: .bottom, spacing: -15) {
                                Image(systemName: "person.crop.circle")
                                    .font(.largeTitle)
                                    .foregroundColor(.blue)
                                
                                Text(item.isActive ? "🟢" : "🔴")
                                    .font(.caption2)
                                }
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .fontWeight(.semibold)
                                //                            Text("Age: \(item.age)")
                                //                                .font(.caption2)
                                Text(item.email)
                                    .font(.caption2)
                            }
                        }
                    }
                }
            }
            .onAppear(perform: loadData)
            .navigationBarTitle("Friends")
        }
    }
    
    
    func loadData() {
        guard let url = URL(string:"https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                //pull out the declaration of the decoder object
                let decoder = JSONDecoder()
                //set how we want to interpret dates in the JSON
                decoder.dateDecodingStrategy = .iso8601
                //decode directly to an array of User structs rather than a Response
                if let decodedResponse = try?
                    decoder.decode([User].self, from: data) {
                    DispatchQueue.main.async {
                        //decodedResponse is now [User] rather than Response.User
                        self.users = decodedResponse
                    }
                    return
                }
            }
            // if we're still here it means there was a problem
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }
        .resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
