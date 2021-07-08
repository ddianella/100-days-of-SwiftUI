//
//  AstronautView.swift
//  Moonshot
//
//  Created by Prince$$ Di on 01.04.2021.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    var missions: [Mission]
    
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.primary, lineWidth: 3))
                        .shadow(radius: 10)
                    
                    Text(self.astronaut.description)
                        .padding()
                    
                    VStack(alignment: .center) {
                        Text("All missions of this astronaut: ")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        List(self.missions) { mission in
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 44, height: 44)
                            VStack(alignment: .leading) {
                                Text(mission.displayName)
                                    .font(.headline)
                                Text(mission.formattedLaunchDate)
                            }
                            
                        }
                        
                    }
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
    init(astronaut: Astronaut, missions: [Mission]) {
        self.astronaut = astronaut
        self.missions = missions
        
        var matches = [Mission]()
        
        for mission in missions {
            if let match = mission.crew.first(where: {$0.name == self.astronaut.id}) {
                matches.append(mission)
            }
        }
        self.missions = matches
    }
}

struct AstronautView_Previews: PreviewProvider {
    
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts[0], missions: missions)
    }
}
