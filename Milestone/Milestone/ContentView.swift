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
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    var body: some View {
        ZStack {
            Color.init(red: 15/255, green: 66/255, blue: 100/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30){
                VStack {
                    Text("Choose your Destiny")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .frame(minWidth: 0, maxWidth: .infinity)
                }
                
                ForEach(0..<self.roShamBo.count) { element in
                    Button( "Element", action: {
                        self.scoreTitle =  self.elementTapped(playerChoice: self.roShamBo[element], computerChoice: self.roShamBo[self.computerChoice])
                    })
                    
                }
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
            scoreTitle = """
            The cumputer choose \(computerChoice)!
            You win🏆, Rock crushes scissors!
            """
            return scoreTitle
        case ("Scissors", "Paper"):
            score += 1
            scoreTitle = """
            The cumputer choose \(computerChoice)!
            You win🏆! Scissors cuts paper!
            """
            return scoreTitle
        case ("Paper", "Rock"):
            score += 1
            scoreTitle = """
            The cumputer choose \(computerChoice)!
            You win🏆! Paper covers rock!
            """
            return scoreTitle
        case ("Scissors", "Rock"):
            scoreTitle = """
            The cumputer choose \(computerChoice)!
            You loose 🥺, rock crushes scissors...
            """
            return scoreTitle
        case ("Paper", "Scissors"):
            scoreTitle = """
            The cumputer choose \(computerChoice)!
            You loose 🥺, scissors cuts paper...
            """
            return scoreTitle
        case ("Rock", "Paper"):
            scoreTitle = """
            The cumputer choose \(computerChoice)!
            You loose 🥺, paper covers rock...
            """
            return scoreTitle
        default:
            scoreTitle = """
            TIE 😬
            The cumputer choose \(computerChoice)!
            """
            return scoreTitle
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
