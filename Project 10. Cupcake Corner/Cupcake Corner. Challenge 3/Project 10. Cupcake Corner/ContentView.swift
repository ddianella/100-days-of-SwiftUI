//
//  ContentView.swift
//  Project 10. Cupcake Corner
//
//  Created by Prince$$ Di on 13.05.2021.
//

import SwiftUI

struct ContentView: View {
   
        
    @ObservedObject var order = MyOrder()
        
       
        var body: some View {
            NavigationView {
                Form {
                Section {
                    Picker("Select your cake type", selection: $order.orderStruct.type) {
                        ForEach(0..<OrderStruct.types.count, id: \.self) {
                            Text(OrderStruct.types[$0])
                        }
                    }
                    
                    Stepper(value: $order.orderStruct.quantity, in: 1...20) {
                        Text("Number of cakes: \(order.orderStruct.quantity)")
                    }
                }
                    
                // second Section
                    Section {
                        Toggle(isOn: $order.orderStruct.specialRequestEnabled.animation()) {
                            Text("Any special requests?")
                        }
                        
                        if order.orderStruct.specialRequestEnabled {
                            Toggle(isOn: $order.orderStruct.extraFrosting) {
                                Text("Add extra frosting")
                            }
                            
                            Toggle(isOn: $order.orderStruct.addSpinkles) {
                                Text("Add extra sprinkles")
                            }
                        }
                        
                    }
                    
                    Section {
                        NavigationLink(destination: AddressView(order: order)) {
                            Text("Delivery details")
                        }
                    }
                
                }.navigationBarTitle("Cupcake Corner")
            }
        }
        
        
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
