//
//  ContentView.swift
//  Project12. CoreDataProject
//
//  Created by Prince$$ Di on 02.06.2021.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"
        
        //MARK:  Challenge: Create sortDescriptors variable
        
        let sortDescriptors = [NSSortDescriptor(keyPath: \Singer.lastName, ascending: true)]
      
        // MARK: Challenge: Create @State private var filteringStyle
        @State private var filteringStyle = FilterType.beginsWith
        
         // MARK: Challenge: Create array of filteringStyle
        let arrayOfFilterType: Array<FilterType> = FilterType.allCases
    
    
    var body: some View {
        VStack {
            // list of matching singers
            FilteredList(filterKey: "lastName", filterValue: lastNameFilter) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }

            Button("Add Examples") {
                let taylor = Singer(context: self.moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"

                let ed = Singer(context: self.moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"

                let adele = Singer(context: self.moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"

                try? self.moc.save()
            }

            Button("Show A") {
                self.lastNameFilter = "A"
            }

            Button("Show S") {
                self.lastNameFilter = "S"
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
