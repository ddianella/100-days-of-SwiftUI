//
//  ContentView.swift
//  WeSplit
//
//  Created by Prince$$ Di on 24.02.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [0, 10, 15, 20, 25]
    var totalPerPerson: Double {
        // the resulting value to a Double so we can add everything up and divide it without losing accuracy and thing has the range 2 to 100, but it counts from 0, which is why we need to add the 2, ecause 2 it's index of picker
        let peopleCount =  Double(numberOfPeople + 2)
        
        //Our tipPercentage property stores the value the user chose, but that’s actually just a position in the tipPercentages array
        let tipSelection = Double(tipPercentages[tipPercentage])
        
        // That will attempt to convert checkAmount into a Double, but if that fails for some reason will use 0 instead.
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    var body: some View {
        NavigationView{
            Form {
                Section {
                    //users can enter the value of their check.
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip persantages", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Text("UAH \(totalPerPerson, specifier: "%.2f")")
                    //Text("UAH \(totalPerPerson, specifier: "%g")")
                        .foregroundColor(tipPercentage==0 ? .blue : .black)
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
