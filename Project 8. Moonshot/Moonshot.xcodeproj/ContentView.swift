//
//  ContentView.swift
//  Moonshot
//
//  Created by Prince$$ Di on 31.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts:[Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var isShowCrewNames = false
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts, missions: self.missions)) {
                    Image(mission.image)
                        .resizable()
                        //.aspectRatio(contentMode: .fit)
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        
                        if self.isShowCrewNames {
                            HStack {
                                Text("Crew Names: \(mission.crewNames)")
                            }
                        } else {
                            Text(mission.formattedLaunchDate)
                        }
                    }
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(trailing: Toggle(isOn: $isShowCrewNames, label: {
                Text("Crew names")
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
