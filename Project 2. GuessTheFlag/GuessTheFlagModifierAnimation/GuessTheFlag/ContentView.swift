//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Prince$$ Di on 27.02.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Ukraine", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var  scoreTitle = ""
    @State private var score = 0
    
    @State private var animationAmount = 0.0
    
    // shake when wrong flag
    @State var attempts: Int = 0
    
    struct Shake: GeometryEffect {
        var amount: CGFloat = 10
        var shakesPerUnit = 3
        var animatableData: CGFloat

        func effectValue(size: CGSize) -> ProjectionTransform {
            ProjectionTransform(CGAffineTransform(translationX:
                amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
                y: 0))
        }
    }
    
    //method automatically picks a random number, which is perfect here – we’ll be using that to decide which country flag should be tapped
    struct FlagImage: View {
        var country: String
        
        var body: some View {
            Image(country)
                .renderingMode(.original)
                .clipShape(Capsule())
                .overlay(Capsule().stroke(Color.black, lineWidth: 2))
                .shadow(color: .black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 60) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                        .font(.title)
                    
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0..<3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    })  {
                        FlagImage(country: self.countries[number])
                    }
                    .rotation3DEffect(.degrees(number == self.correctAnswer ? self.animationAmount : 0), axis: (x: 0, y: 1, z: 0))
                    
                    // модифікатор .opacity знаходиться на кнопці постійно, а не лише під час натискання кнопки. Потрібна одна умова, щоб перевірити, чи не було натиснуто кнопку
                    .opacity(self.showingScore && number != self.correctAnswer ? 0.25 : 1.0)
                    
                    .modifier(Shake(animatableData: CGFloat(self.attempts)))
                    
                    
                }
                
                VStack {
                    Text("Score: \(score)")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                }
                // Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score+=1
            
            withAnimation(.default) {
                self.animationAmount += 360.0
                
            }
        }
        else {
            scoreTitle = "Wrong! That’s the flag of \(countries[number])"
            score-=1
            
            withAnimation(.default) {
                self.attempts += 1
            }
            
        }
        showingScore = true
    }
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in:0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
