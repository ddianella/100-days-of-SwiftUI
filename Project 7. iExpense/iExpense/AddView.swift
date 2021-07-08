//
//  AddView.swift
//  iExpense
//
//  Created by Prince$$ Di on 30.03.2021.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    @State private var isAlert = false
    @State private var messageForAlert = ""
    
    static let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Section(header: Text("Type of expence")) {
                    Picker("Type", selection: $type) {
                        ForEach(Self.types, id: \.self) {
                            Text($0)
                        }
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add new expence")
            .navigationBarItems(trailing: Button("Save") {
                if let actualAmount = Int(self.amount) {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                }
                else {
                    self.isAlert = true
                    self.messageForAlert = self.amount
                }
            }).alert(isPresented: $isAlert) {
                Alert(title: Text("Invalid input"), message: Text("Please, enter correct ammount. Not \(self.messageForAlert)"), dismissButton: .default(Text("Continue")) {
                })
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
