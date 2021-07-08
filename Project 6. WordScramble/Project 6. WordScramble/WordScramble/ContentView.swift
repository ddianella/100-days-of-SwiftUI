//
//  ContentView.swift
//  WordScramble
//
//  Created by Prince$$ Di on 11.03.2021.
//

import SwiftUI

struct ContentView: View {
    // array of words that user have already used,
    @State private var usedWords = [String]()
    // root word for them to spell other words from
    @State private var rootWord = ""
    // a string we can bind to a text field
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    @State private var score = 0
    
    
    var body: some View {
        NavigationView {
            VStack {
                // onCommit - при фиксации
                TextField("Enter your word", text: $newWord, onCommit: addNewWord)
                    //disable capitalization for the text field
                    .autocapitalization(.none)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Text("Score: \(score)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                //Прямо надаючи usedWords to List, ми просимо його зробити один рядок, який індивідуальний для кожного слова в масиві
                List(usedWords, id: \.self) {
                    Image(systemName: "\($0.count).circle")
                    Text($0)
                }
               
            }
            .navigationBarTitle(rootWord)
            .navigationBarTitle("Make other words from the word")
            .navigationBarItems(leading: Button(action: startGame)
            {
                Image(systemName: "goforward")
                Text("Another word")
            } )

            .onAppear(perform: startGame)
            .alert(isPresented: $showingError) {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    
    func addNewWord() {
        // lowercase and trim the word, to make sure we don't add duplicate words with case differences
        // нижній регістр та обрізання слова, абии переконатись, що немає слів-дублікатів з різнм регістром
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // exit if the remaining string is empty
        // вихід, якщо рядок порожній
        guard answer.count > 0 else {
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            score -= 1
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            score -= 1
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not possible", message: "That isn't a real word.")
            score -= 1
            return
        }
        
        usedWords.insert(answer, at: 0)
        newWord = ""
        score += answer.count
    }
    
    func startGame() {
        
        score = 0
        // 1. Find the URL for start.txt in our app bundle
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // 2. Load start.txt into a string
            if let startWords = try? String(contentsOf: startWordsURL) {
                // 3. Split the string up into an array of strings, splitting on line breaks
                let allWords = startWords.components(separatedBy: "\n")
                
                // 4. Pick one random word, or use "silkworm" as a sensible default
                rootWord = allWords.randomElement() ?? "silkworm"
                
                // If we are here everything has worked, so we can exit
                return
            }
        }
        // If were are *here* then there was a problem – trigger a crash and report the error
        fatalError("Could not load start.txt from bundle.")
    }
    
    //Чи слово вживалося раніше
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        //guard (word.count) > 3 || !(rootWord == word) else { return false }
        if word.count < 3 || word == rootWord {
            return false
        }
        
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
