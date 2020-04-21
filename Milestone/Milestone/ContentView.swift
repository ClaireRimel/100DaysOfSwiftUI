//
//  ContentView.swift
//  Milestone
//
//  Created by Claire on 14/04/2020.
//  Copyright © 2020 Claire Sivadier. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var roShamBo = ["Rock", "Paper", "Scissors"]
    
    @State private var computerChoice = Int.random(in: 0...2)
    @State private var numberOfParty = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    var body: some View {
        ZStack {
            Color.init(red: 15/255, green: 66/255, blue: 100/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 40){
                VStack {
                    Text("Choose your Destiny")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .frame(minWidth: 0, maxWidth: .infinity)
                }
                
                HStack(spacing: 30) {
                ForEach(0..<self.roShamBo.count) { element in
                    Button(action: {
                        
                        if self.numberOfParty < 10 {
                        self.scoreTitle =  self.elementTapped(playerChoice: self.roShamBo[element], computerChoice: self.roShamBo[self.computerChoice])
                            
                        } else {
                           self.restScore()
                             self.scoreTitle =  self.elementTapped(playerChoice: self.roShamBo[element], computerChoice: self.roShamBo[self.computerChoice])
                        }
                        })
                        {
                            ElementsImage(image: self.roShamBo[element])
                    }
                    }
                }
                
                 Text("\(self.numberOfParty)/10")
                .foregroundColor(.white)
                                       .font(.largeTitle)
                                       .frame(minWidth: 0, maxWidth: .infinity)
                Spacer()
            }
            
        }
        .alert(isPresented: $showingScore){
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("OK")) {
                
                self.computerChoice = Int.random(in: 0...2)
                })
        }
    }
    
    func elementTapped(playerChoice: String, computerChoice: String) -> String {
        showingScore = true
        switch (playerChoice, computerChoice) {
        case ("Rock", "Scissors"):
            score += 1
            numberOfParty += 1
            scoreTitle = """
            The cumputer chose \(computerChoice)!
            Rock crushes scissors!
            You win🏆!
            """
            return scoreTitle
        case ("Scissors", "Paper"):
            score += 1
            numberOfParty += 1
            scoreTitle = """
            The cumputer chose \(computerChoice)!
            Scissors cuts paper!
            You win🏆!
            """
            return scoreTitle
        case ("Paper", "Rock"):
            score += 1
            numberOfParty += 1
            scoreTitle = """
            The cumputer chose \(computerChoice)!
            Paper covers rock!
            You win🏆!
            """
            return scoreTitle
        case ("Scissors", "Rock"):
            numberOfParty += 1
            scoreTitle = """
            The cumputer chose \(computerChoice)!
            You loose 🥺, rock crushes scissors...
            """
            return scoreTitle
        case ("Paper", "Scissors"):
            numberOfParty += 1
            scoreTitle = """
            The cumputer chose \(computerChoice)!
            You loose 🥺, scissors cuts paper...
            """
            return scoreTitle
        case ("Rock", "Paper"):
            numberOfParty += 1
            scoreTitle = """
            The cumputer chose \(computerChoice)!
            You loose 🥺, paper covers rock...
            """
            return scoreTitle
        default:
            numberOfParty += 1
            scoreTitle = """
            TIE 😬
            The cumputer chose \(computerChoice)!
            """
            return scoreTitle
        }
    }
    
    func restScore() {
        numberOfParty = 0
        score = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
