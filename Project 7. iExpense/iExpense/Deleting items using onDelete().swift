//
//  Delete button.swift
//  iExpense
//
//  Created by Prince$$ Di on 15.04.2021.
//

import SwiftUI

struct Deleting_items_using_onDelete: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("\($0)")
                    }
                    .onDelete(perform: removeRows(at:))
                }
                Button("Add number") {
                    numbers.append(currentNumber)
                    currentNumber+=1
                }
            }
            .navigationBarItems(leading: EditButton())
        }
    }
    
    //  IndexSet - відсортований набір цілих чисел, що повідомляє про позиції всіх елементів у ForEach, які слід видалити
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct Deleting_items_using_onDelete_Previews: PreviewProvider {
    static var previews: some View {
        Deleting_items_using_onDelete()
    }
}
