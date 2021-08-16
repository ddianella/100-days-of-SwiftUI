//
//  ProspectsView.swift
//  Project 16. HotProspects
//
//  Created by Prince$$ Di on 04.08.2021.
//
import CodeScanner
import SwiftUI
import UserNotifications


struct ProspectsView: View {
    //дозволяє кожному екземпляру ProspectsView дещо відрізнятися, надаючи йому нову властивість
    let filter: FilterType
    @EnvironmentObject var prospects: Prospects
    
    @State private var isShowingScanner = false
    
    @State private var isShowingSheet = false
    
    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted people"
        case .uncontacted:
            return "Uncontacted people"
        }
    }
    
    var filteredProspects: [Prospect] {
        switch filter {
        case .none:
            return prospects.people
        case .contacted:
            return prospects.people.filter { $0.isContacted }
        case .uncontacted:
            return prospects.people.filter { !$0.isContacted }
        }
    }
    
    // MARK: Day 85. Challenge 3.1
    enum SortedType {
        case name, dateAdded
    }
    
    @State private var sortType = SortedType.name
    
    var sortedProspects: [Prospect] {
        switch sortType {
        case .name:
            return filteredProspects.sorted { (firstProspect, secondProspect) -> Bool in
                return firstProspect.name < secondProspect.name
            }
        case .dateAdded:
            return filteredProspects.sorted { (firstProspect, secondProspect) -> Bool in
                return firstProspect.dateAdded < secondProspect.dateAdded
            }
        }
    }
    
    
    // MARK: Day 85. Challenge 3.2
    
    enum CheckBoxType {
        case name, dateAdded
    }
    func checkBox(forType: CheckBoxType) -> String {
        switch forType  {
        case .name:
            return sortType == .name ? "✔️" : ""
        case .dateAdded:
            return sortType == .dateAdded ? "✔️" : ""
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(sortedProspects) { prospect in
                    HStack {
                        IsContactedImage(isContacted: prospect.isContacted)
                        VStack(alignment: .leading) {
                            Text(prospect.name)
                                .font(.headline)
                            Text(prospect.emailAddress)
                                .foregroundColor(.secondary)
                        }
                    }
                    .contextMenu {
                        Button(prospect.isContacted ? "Mark Uncontacted" : "Mark Contacted" ) {
                            self.prospects.toggle(prospect)
                        }
                        if !prospect.isContacted {
                            Button(action: {
                                self.addNotification(for: prospect)
                            }) {
                                Text("Remind me")
                                Image(systemName: "bell")
                            }
                            
                            
                        }
                    }
                }
            }
            .navigationBarTitle(title)
            .navigationBarItems(leading: Button(action: {
                self.isShowingSheet = true
                
            }, label: {
                Text("Sorting")
            }), trailing: Button(action: {
                self.isShowingScanner = true
            }) {
                Image(systemName: "qrcode.viewfinder")
                Text("Scan")
            })
            .sheet(isPresented: $isShowingScanner) {
                CodeScannerView(codeTypes: [.qr], simulatedData: "Diana Domoslavska\ndi140398@gmail.com", completion: self.handleScan)
            }
            .actionSheet(isPresented: $isShowingSheet) { () -> ActionSheet in
                ActionSheet(title: Text("Sort By:"), message: nil,  buttons: [.default(Text("Name \(checkBox(forType: .name))"), action: {
                    self.sortType = .name
                }), .default(Text("Date Added \(checkBox(forType: .dateAdded))"), action: {
                    self.sortType = .dateAdded
                }), .cancel()])
            }
        }
    }
    
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    func handleScan(result: Result<String, CodeScannerView.ScanError>) {
        self.isShowingScanner = false
        
        switch result {
        case .success(let code):
            let details = code.components(separatedBy: "\n")
            guard details.count == 2 else { return }
            
            let person = Prospect()
            person.name = details[0]
            person.emailAddress = details[1]
            person.dateAdded = Date()
            
            
            //Save to UsersDefaults
            self.prospects.add(person)
            
            
        case .failure(let error):
            print("Scanning failed")
        }
    }
    
    func addNotification(for prospect: Prospect) {
        let center = UNUserNotificationCenter.current()
        
        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Contact \(prospect.name)"
            content.subtitle = prospect.emailAddress
            content.sound = UNNotificationSound.default
            
            //            var dateComponents = DateComponents()
            //            dateComponents.hour = 9 //спрацює наступного разу о 9 ранку
            //            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            // or to test now
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }
        
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else {
                        print("D'oh")
                    }
                }
            }
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
    }
}
