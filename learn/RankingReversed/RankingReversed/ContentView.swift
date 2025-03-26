//
//  ContentView.swift
//  RankingReversed
//
//  Created by Manuel Duarte on 6/2/25.
//

import SwiftUI

// Modelo de Jugador
struct Player: Identifiable {
    let id = UUID()
    let name: String
    let score: Int
}

// Vista Principal
struct ContentView: View {
    @State private var players: [Player] = [
        Player(name: "Lucca", score: 1200),
        Player(name: "Ana", score: 900),
        Player(name: "Carlos", score: 1500),
        Player(name: "Beatriz", score: 1100),
        Player(name: "David", score: 1300)
    ]
            
    func reverseArray(_ array: inout [Player]) {
        var left = 0
        var right = array.count - 1
        
        while left < right {
            array.swapAt(left, right) //
            left += 1
            right -= 1
        }
        
        print(array)
    }
    
    var sortedPlayers: [Player] {
        players.sorted { $0.score > $1.score } // Ordenamos de mayor a menor puntaje
    }

    var body: some View {
        NavigationView {
            VStack {
                List(players) { player in
                    HStack {
                        Text(player.name)
                            .font(.headline)
                        Spacer()
                        Text("\(player.score) pts")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(5)
                }
                .navigationTitle("🏆 Ranking")
                
                Button(action: {
                    reverseArray(&players)
                }) {
                    Text("🔄 Invertir Ranking")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                }
            }
        }
    }
}

// Preview para SwiftUI
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
