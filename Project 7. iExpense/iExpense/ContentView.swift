//
//  ContentView.swift
//  iExpense
//
//  Created by Prince$$ Di on 26.03.2021.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    // 1. Спробуйте прочитати ключ «Items» з UserDefaults.
    // 2. Створіть екземпляр JSONDecoder, який є аналогом JSONEncoder, який дозволяє нам переходити від даних JSON до об'єктів Swift.
    // 3. Попросіть декодер перетворити дані, отримані від UserDefaults, в масив об'єктів ExpenseItem.
    // 4. Якщо це спрацювало, надайте отриманий масив елементів і вийдіть.
    // 5. В іншому випадку встановіть елементи як порожній масив.
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        
        self.items = []
    }
}

struct ContentView: View {
    
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
                    List {
                        ForEach(expenses.items) { item in
                            //Text(item.name)
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                Spacer()
                                //                        Text("$\(item.amount)")
                                //                            .font(.headline)
                                Text("$\(item.amount)")
                                    .foregroundColor(item.amount <= 100 ? .green : item.amount >= 100 && item.amount > 1000 ? .orange : .red)
                                    .font(item.amount <= 100 ? .title3 : item.amount >= 100 && item.amount > 1000 ? .title : .title2)
                            }
                        }
                        .onDelete(perform: removeItems)
                    }
                    .navigationBarTitle("💸 iExpense 💸")
                    .navigationBarItems(leading: EditButton(), trailing:
                                            Button(action: {
                                                self.showingAddExpense = true
                                            }) {
                                                Image(systemName: "plus")
                                            }
                    )
                    .sheet(isPresented: $showingAddExpense) {
                        AddView(expenses: self.expenses)
                    }
                }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
