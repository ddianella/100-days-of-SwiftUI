//
//  ContentView.swift
//  WeSplit
//
//  Created by Prince$$ Di on 24.02.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    let tipPercentages = [0, 10, 15, 20, 25]
    var totalPerPerson: Double {
        let peopleCount =  Double(numberOfPeople) ?? 2
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var grandTotal: Double {
        let orderAmount = Double(checkAmount) ?? 0
        let tipSelection = Double(tipPercentages[tipPercentage])
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        return grandTotal
    }
    var body: some View {
        NavigationView{
            Form {
                Section {
                    //users can enter the value of their check.
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    TextField("Number of people", text: $numberOfPeople)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip persantages", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Amount per person")) {
                    Text("UAH \((totalPerPerson), specifier: "%.2f")")
                    //Text("UAH \(totalPerPerson, specifier: "%g")")
                }
                Section(header: Text("Ammount with tips")) {
                    Text("UAH \((grandTotal), specifier: "%.2f" )")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
