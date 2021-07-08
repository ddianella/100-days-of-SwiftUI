//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Prince$$ Di on 09.03.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var game = ["rock", "paper", "scissors"]
    @State private var  appChoice = Int.random(in: 0..<3)
    @State private var shouldWin = Bool.random()
    
    @State private var score = 0
    @State private var maxScore = 10
    @State private var showingScore = false
    
    var WinOrLose: String {
        if shouldWin == true {
            return "win"
        }
        else {
            return "lose"
        }
    }
    
    //Image modifier
    struct ImageGame: View {
        var game : String
        var body : some View {
            Image(game)
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color(.black),lineWidth: 5))
                .shadow(radius: 10)
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack{
//                Color.init(#colorLiteral(red: 0.9606924653, green: 1, blue: 0.9089924693, alpha: 1))
//                    .edgesIgnoringSafeArea(.all)
                
                
                VStack(spacing: 70) {
                    Text("Score: \(score)")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("You should: \(WinOrLose)")
                        .foregroundColor(shouldWin ? .green : .red)
                    ImageGame(game: self.game[appChoice])
                    
                    
                    HStack(spacing:15) {
                        ForEach(0..<3) { number in
                            Button(action: {
                                continueGame()
                                playerChoose(userChoice: number, appChoice: game[appChoice], shouldWin)
                                shouldWin = Bool.random()
                                appChoice = Int.random(in: 0..<3)
                            })
                            {
                                ImageGame(game: self.game[number])
                            }
                        }
                    }
                    
                }
                .alert(isPresented: $showingScore) {
                    Alert(title: Text("Game Over!"), message: Text("Your score has reached 10. Good job! Do you want continue?"), dismissButton: .default(Text("Continue")))
                }
                
                .font(.largeTitle)
                .navigationTitle("Rock, paper or scissors?")
                .lineLimit(2)
            }
        }
    }
    func playerChoose(userChoice: Int, appChoice: String, _ shouldWin: Bool) {
        var userWins: Bool
        
        if (userChoice == 0 && appChoice == game[2]) || (userChoice == 1 && appChoice == game[0]) || (userChoice == 2 && appChoice == game[1]) {
            userWins = true
        }
        else {
            userWins = false
        }
        
        if (!shouldWin && userWins == false) || (shouldWin && userWins == true ) {
            userWins = true
            score+=1
        }
        else {
            userWins = false
            score-=1
        }
    }
    
    func continueGame() {
        if score == 10 {
            showingScore = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
