//
//  ContentView.swift
//  DayConverter
//
//  Created by Prince$$ Di on 26.02.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = ""
    @State private var inputCollection = 1
    @State private var outputCollection = 1
    
    let inputCollections = ["sec", "min", "hours", "days"]
    let outputCollections = ["sec", "min", "hours", "days"]
    
var converter: Double {
    //let inputSelection = Double(inputCollections[inputCollection])
    //let outputSelection = Double(outputCollections[outputCollection])
    let inputValue = Double(inputUnit) ?? 0
    
    switch (inputCollection, outputCollection) {
    case (0,1):
        //sec -> min
        return inputValue / 60
    case (0,2):
        //sec -> hours
        return inputValue / 3600
    case (0,3):
        //sec -> days
        return inputValue / 86400
        
    case (1,0):
        // min -> sec
        return inputValue * 60
    case (1,2):
        // min -> hours
        return inputValue / 60
    case (1,3):
        // min -> days
        return inputValue / 1440
        
    case (2,0):
        //hours -> sec
    return inputValue * 3600
    case (2,1):
        //hours -> min
    return inputValue * 60
    case (2,3):
        //hours -> days
    return inputValue / 24
    
    case (3,0):
        //days -> sec
    return inputValue * 86400
    case (3,1):
        //days -> min
    return inputValue * 1440
    case (3,2):
        //days -> hours
    return inputValue * 24
        
    default:
        return inputValue
    }
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    TextField("Enter your unit", text: $inputUnit)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Select input unit")) {
                    Picker("Select your unit", selection: $inputCollection) {
                        ForEach(0..<inputCollections.count) {
                            Text("\(self.inputCollections[$0])")
                        }
                    } .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Select result unit")) {
                    Picker("Result unit", selection: $outputCollection) {
                        ForEach(0..<outputCollections.count) {
                            Text("\(self.outputCollections[$0])")
                        }
                    } .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Result")) {
                    Text("\(converter, specifier: "%.2f")")
                }
            }
            .navigationTitle("TimeConverter")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
