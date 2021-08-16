//
//  Prospect.swift
//  Project 16. HotProspects
//
//  Created by Prince$$ Di on 04.08.2021.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    let id = UUID()
    var name = "Diana"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
    var dateAdded = Date()
}

class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    
    static let saveKey = "SavedData"

    init() {
//        if let data = UserDefaults.standard.data(forKey: Self.saveKey) {
//            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
//                self.people = decoded
//                return
//            }
//        }
//        self.people = []
        
        // MARK: Day 85. Challenge 2.3
                let fileName = Self.getDocumentsDirectory().appendingPathComponent(Self.saveKey)
                do {
                    let data = try Data(contentsOf: fileName)
                    let people = try JSONDecoder().decode([Prospect].self, from: data)
                    
                    // MARK: For Test data
                  // self.people = TestPeople.createArray()
                    
                  self.people = people
                } catch {
                    print("Unable to load saved data")
                    self.people = []
                }
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
    
   private func save2() {
        if let encoded = try? JSONEncoder().encode(people) {
            UserDefaults.standard.set(encoded, forKey: Self.saveKey)
        }
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    // MARK: Day 85. Challenge 2.2
         func save() {
            let fileName = Self.getDocumentsDirectory().appendingPathComponent(Self.saveKey)
            do {
                let data = try JSONEncoder().encode(people)
                try data.write(to: fileName, options: [.atomicWrite, .completeFileProtection])
            } catch {
                print("Unable to save data")
            }
        }
    
    //  Day 85.  Challenge 2.1
       static func getDocumentsDirectory() -> URL {
           // find all possible documents directories for this user
           let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
           
           // just send back the first one, which ought to be the only one
           return paths[0]
       }
}
