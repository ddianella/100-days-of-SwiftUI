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
    
    enum MeasureUnit: Int { case sec, min, hours, days }
    
    var converter: Double {
        //    let inputValue = Double(inputUnit) ?? 0
        // let enteredData = Measure(MeasureUnit(rawValue: inputCollection)!, MeasureUnit(rawValue: outputCollection)!)
        let inputedMeasure = MeasureUnit(rawValue: inputCollection)!
        let outputMeasure = MeasureUnit(rawValue: outputCollection)!
        let inputedValueSecond = convertToSecond(from: inputedMeasure, inputValue: inputUnit)
        let result = convertFromSecond(to: outputMeasure, inputSecondValue: inputedValueSecond)
        return result
    }
    
    func convertToSecond(from measure: MeasureUnit, inputValue: String) -> Double {
        guard let inputDoubleValue = Double(inputValue) else { return 0.0 }
        switch  measure {
        case .sec: return inputDoubleValue
        case .min: return inputDoubleValue * 60
        case .hours: return inputDoubleValue * 3600
        case .days: return inputDoubleValue * 3600 * 24
        }
    }
    
    func convertFromSecond(to measure: MeasureUnit, inputSecondValue: Double) -> Double {
        switch  measure {
        case .sec: return   inputSecondValue
        case .min: return   inputSecondValue / 60
        case .hours: return inputSecondValue / 3600
        case .days: return  inputSecondValue / (3600 * 24)
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
