//
//  ContentView.swift
//  MyHabits
//
//  Created by Prince$$ Di on 27.04.2021.
//

import SwiftUI

// a single activity
struct Activity: Identifiable, Codable {
    var id = UUID()
    let name: String
    let description: String
    var amount: Int
    //let goal: Int
}

//store an array of those activities items inside a single object
class Activities: ObservableObject {
    @Published var items = [Activity]() {
        didSet {
            saveActivities()
        }
    }
    
    func saveActivities() {
        let encoder = JSONEncoder()
        
        if let encoded = try? encoder.encode(items) {
            UserDefaults.standard.set(encoded, forKey: "Items")
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Activity].self, from: items) {
                self.items = decoded
                return
            }
        }
        
        self.items = []
    }
}


struct ContentView: View {
    @ObservedObject var activities = Activities()
    @State private var showingAddHabit = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                List {
                    ForEach(activities.items) { item in
                        NavigationLink(destination: DetailOfHabit(activity: item, activities: self.activities)) {
                            HStack {
                                VStack(alignment: .leading) {
                                Text("\(item.name)")
                                    .font(.headline)
                                Text("\(item.description)")
                                }
                                Spacer()
                                Text(" \(item.amount)")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    //.foregroundColor(.black)
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                    
                }
            }
            
            .navigationTitle("MyHabits")
            .navigationBarItems(leading: EditButton(), trailing:
                                    Button(action: {
                                        self.showingAddHabit = true
                                    })
                                    {
                                        Image(systemName: "plus")
                                    }
            )
            .foregroundColor(.black)
            .sheet(isPresented: $showingAddHabit) {
                AddView(activities: self.activities)
            }
        }
    }
    
    
    func removeItems(at offsets: IndexSet) {
        activities.items.remove(atOffsets: offsets)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
