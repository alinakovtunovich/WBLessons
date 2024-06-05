//
//  GameScreen.swift
//  WBFirst
//
//  Created by Ayrmidon Hagraven on 6/5/24.
//

import SwiftUI

enum Team: CaseIterable {
    case one
    case second
}

struct Game {
    var scores: [Int] = [0, 0]
    var whoWin: Team?
    var isGameOver: Bool = false
    
    mutating func incrementScore(team: Team) {
        switch team {
        case .one:
            scores[0] += 1
        case .second:
            scores[1] += 1
        }
        whoWin = scores[0] == scores[1] ? nil : (scores[0] > scores[1] ? .one : .second)
        isGameOver = scores.contains(10)
    }
    
}

struct GameScreen: View {
    
    @State var game: Game = .init()
    
    var body: some View {
        VStack {
            Text("Game 🎮")
                .frame(height: 300)
                .font(.system(size: 50))
                
            
            HStack {
                playerCell(title: "First", who: .one)
                playerCell(title: "Second", who: .second)
            }
        }

    }
    
    func playerCell(title: String, who: Team) -> some View {
        VStack {

            Text(title).font(.title)
                .padding(10)
            Image(systemName: "circle.fill")
                .foregroundColor(game.whoWin == who ? .green : .red)

            Button { game.incrementScore(team: who) }
        label: {
            Image(systemName: "\(game.scores[who == .one ? 0 : 1]).circle.fill")
                .font(.system(size: 100))
        }
        .padding(25)
        }.alert(isPresented: $game.isGameOver) {
            Alert(title: Text("Finish"),
                  message: Text("Winner is \(game.whoWin == .one ? "FIRST" : "SECOND") player 🎉"),
                  dismissButton: .default(Text("Reset")) { game = .init() })
        }
        
    }
}

struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameScreen()
    }
}
