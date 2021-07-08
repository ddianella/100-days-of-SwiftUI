//
//  AddressView.swift
//  Project 10. Cupcake Corner
//
//  Created by Prince$$ Di on 17.05.2021.
//

import SwiftUI

struct AddressView: View {
     @ObservedObject var order: MyOrder
       
       
       
       var body: some View {
           Form {
               Section {
                   TextField("Name", text: $order.orderStruct.name)
                   TextField("Street Address", text: $order.orderStruct.streetAddress)
                   TextField("City", text: $order.orderStruct.city)
                   TextField("Zip", text: $order.orderStruct.zip)
               }
               
               Section {
                NavigationLink(destination: CheckoutView(order: order)) {
                       Text("Check out")
                   }
               }
               .disabled(order.orderStruct.hasValidAddress == false)
           }
           .navigationBarTitle("Delivety details", displayMode: .inline)
       }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: MyOrder())
    }
}
