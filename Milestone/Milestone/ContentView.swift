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
    @State private var shouldWin = Bool.random()
    @State private var playerWin = true
    @State private var showingScore = false
    @State private var scoreMessage = ""
    @State private var numberOfParty = 0
    @State private var score = 0
    
    var body: some View {
        ZStack {
            Color.init(red: 15/255, green: 66/255, blue: 100/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 40){
                VStack {
                    Image(self.roShamBo[computerChoice])
                    
                    if shouldWin == true {
                        Text("You have to win")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .frame(minWidth: 0, maxWidth: .infinity)
                    } else {
                        Text("You have to lose")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                }
                
                HStack(spacing: 30) {
                    ForEach(0..<self.roShamBo.count) { element in
                        Button(action: {
                            
                            if self.numberOfParty < 10 {
                                self.numberOfParty += 1
                                self.playerWin = self.elementTapped(playerChoice: self.roShamBo[element], computerChoice: self.roShamBo[self.computerChoice])
                                print(self.numberOfParty)
                                
                                if self.playerWin == self.shouldWin {
                                    self.score += 1
                                    
                                }
                                
                                if self.numberOfParty ==  10 {
                                    self.showingScore = true
                                    self.scoreMessage = "YYYeeeaahh your score is \(self.score)"
                                }
                            }
                            self.newSet()
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
            }
            .padding(.top, 50.0)
        }
            
        .alert(isPresented: $showingScore) {
            Alert(title: Text("Finished 🎉"), message: Text(scoreMessage), dismissButton: .default(Text("OK")) {
                self.restScore()
                })
        }
    }
    
    func elementTapped(playerChoice: String, computerChoice: String) -> Bool {
        
        switch (playerChoice, computerChoice) {
        case ("Rock", "Scissors"):
            playerWin = true
            return playerWin
        case ("Scissors", "Paper"):
            playerWin = true
            return playerWin
        case ("Paper", "Rock"):
            playerWin = true
            return playerWin
        case ("Scissors", "Rock"):
            playerWin = false
            return playerWin
        case ("Paper", "Scissors"):
            playerWin = false
            return playerWin
        case ("Rock", "Paper"):
            playerWin = false
            return playerWin
        default:
            playerWin = false
            return playerWin
        }
    }
    
    func newSet() {
        shouldWin = Bool.random()
        computerChoice = Int.random(in: 0...2)
    }
    
    func restScore() {
        showingScore = false
        numberOfParty = 0
        score = 0
        newSet()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
