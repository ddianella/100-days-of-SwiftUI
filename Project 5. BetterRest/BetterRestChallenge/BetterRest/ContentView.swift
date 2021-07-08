//
//  ContentView.swift
//  BetterRest
//
//  Created by Prince$$ Di on 06.03.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    
    var body: some View {
        NavigationView {
            Form {
                //VStack(alignment: .leading, spacing: 0) {
                Section {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .pickerStyle(WheelPickerStyle())
                }
                
                Section {
                    //VStack(alignment: .leading, spacing: 0) {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                }
                
                Section {
                    //VStack(alignment: .leading, spacing: 0) {
                    Text("Daily coffee intake")
                        .font(.headline)
                    Picker("Number of cups", selection: $coffeeAmount) {
                        ForEach(1..<21) {
                            if $0 > 1 {
                                Text("\($0) cups")
                            } else {
                                Text("1 cup")
                            }
                        }
                        //                        ForEach(1..<21) {
                        //                        Text($0 > 1 ? "\($0) cups" : "\($0) cup")
                        //                    }
                    }
                }
                
                Section(header: Text("Your ideal bedtime is...")) {
                                Text("\(calculateBedtime())")
                            }
            }
            .navigationBarTitle("BetterRest")
            
            
        }
    }
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    func calculateBedtime() -> String {
        let model = SleepCalculator()
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            return formatter.string(from: sleepTime)
        }
        catch {
           return "Sorry, there was a problem calculating your bedtime."
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
