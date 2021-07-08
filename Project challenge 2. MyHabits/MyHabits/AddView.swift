//
//  AddView.swift
//  MyHabits
//
//  Created by Prince$$ Di on 28.04.2021.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var activities: Activities
    
    @State private var name = ""
    @State private var description = ""
   // @State private var goal = ""
    @State private var amount = 0
    
    @State private var isAlert = false
    @State private var messageForAlert = ""
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Enter name of habit")) {
                    TextField("New habit", text: $name)
                }
                Section(header: Text("Enter description of habit")) {
                    TextField("Description", text: $description)
                }
//                Section(header: Text("Enter your goal")) {
//                    TextField("Goal", text: $goal)
//                        .keyboardType(.numberPad)
//                }
//                Section(header: Text("Completed times")) {
//                    Stepper(value: $amount, in: 0...Int.max, step: 1) {
//                        Text("\(amount) times")
//                    }
//                }
            }
            .navigationBarTitle("Add new habit")
            .navigationBarItems(trailing: Button("Save") {
                let item = Activity(name: self.name, description: self.description, amount: self.amount)
                self.activities.items.append(item)
                self.activities.saveActivities()
                self.presentationMode.wrappedValue.dismiss()
            } )
//            else {
//            self.isAlert = true
//            self.messageForAlert = self.name
//            self.messageForAlert = self.description
//            } )
        }
        .alert(isPresented: $isAlert) {
            Alert(title: Text("Invalid input"), message: Text("Please, enter correct name or description."), dismissButton: .default(Text("OK")))
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(activities: Activities())
    }
}
