//
//  DetailOfHabit.swift
//  MyHabits
//
//  Created by Prince$$ Di on 28.04.2021.
//

import SwiftUI

struct DetailOfHabit: View {
    @State var activity: Activity
    @ObservedObject var activities: Activities
    
    func incrementCount() {
        if let index = activities.items.firstIndex(where: { $0.id == activity.id }) {
            var newActivity = activities.items[index]
            newActivity.amount += 1
            activities.items[index] = newActivity
            activity = newActivity
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                Text(activity.description)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                // .fontWeight(.semibold)
                Text("Completed: \(activity.amount) times")
                    .font(.title2)
                //Divider()
                //Spacer()
                
                Button(action: {
                    self.incrementCount()
                }) {
                    Text("+1 to my goal").padding( .vertical, 15).padding(.horizontal, 70).foregroundColor(.white).font(.title)
                        .background(Color.black).cornerRadius(20)
                        .shadow(radius: 20)
                }
               
                
                //Spacer()
            }
            .navigationBarTitle(Text(activity.name))
        }
    }
}




struct DetailOfHabit_Previews: PreviewProvider {
    static var previews: some View {
        DetailOfHabit(activity:(Activity(name: "Workout", description: "Getting bigger", amount: 0)), activities: Activities())
    }
}
