//
//  ContentView.swift
//  ListApp
//
//  Created by mac on 10/01/22.
//

import SwiftUI

struct ContentView: View {
    @State private var useWords = [String]();
    @State private var rootWords = "";
    @State private var newWorld = "";
    
    @State private var errorTitle = "";
    @State private var errorMesage = "";
    @State private var showError = false;
    
    var body: some View {
        NavigationView(){
            VStack(){
                TextField("Enter your words", text: $newWorld, onCommit: addNewWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                
                
                List(useWords, id: \.self){
                    Image(systemName: "\($0.count).square")
                    Text($0)
                }
                .listStyle(GroupedListStyle())
            }
        }
        .navigationBarTitle("App")
        .onAppear(perform: getStartWords)
        .alert(isPresented: $showError){
            Alert(title: Text(errorTitle), message: Text(errorMesage), dismissButton: .default(Text("Ok")))
        }
    }
    
    func addNewWord(){
        let answer = newWorld.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else {
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "No more original")
            
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not recognized", message: "you can't just make them up , you know")
            
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not possible", message: "that isn't real word")
            
            return
        }
        
        
        useWords.insert(answer, at: 0);
        newWorld = ""
    }
    
    func getStartWords(){
        if let startFileURL = Bundle.main.url(forResource: "start", withExtension: "txt"){
            if let startWords = try? String(contentsOf: startFileURL){
                let allWords = startWords.components(separatedBy: "\n");
                rootWords = allWords.randomElement() ?? "Hello";
                return
            }
        }
        fatalError("Could not load the start.txt file from bundle");
    }
    
    func wordError(title: String, message: String){
        errorTitle = title;
        errorMesage = message;
        showError = true
    }
    
    func isOriginal(word: String) -> Bool{
        !useWords.contains(word);
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWords.lowercased();
        print(tempWord)
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter){
                tempWord.remove(at: pos)
            }else{
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker();
        let range = NSRange(location: 0, length: word.utf16.count);
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
