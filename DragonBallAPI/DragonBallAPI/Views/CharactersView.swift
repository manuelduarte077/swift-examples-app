//
//  CharactersView.swift
//  DragonBallAPI
//
//  Created by Manuel Duarte on 25/9/24.
//

import SwiftUI

struct CharactersView: View {
    @StateObject private var viewModel = CharacterViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.characters) { character in
                NavigationLink(destination: CharacterDetailView(character: character)) {
                    AsyncImage(url: URL(string: character.image)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                            .padding()
                            .frame(width: 100, height: 100)
                            .background(Color.gray.opacity(0.7))
                            .clipShape(Circle())
                    }
                    VStack (alignment: .leading){
                        Text(character.name)
                            .font(.title2)
                            .bold()
                        Text(character.race)
                        
                        if let kiValue = Double(character.ki.replacingOccurrences(of: ".", with: "").replacingOccurrences(of: ",", with: "")), kiValue > 0 {
                            Text("\(character.ki) 🚀")
                        }
                    }
                }
            }
            .onAppear {
                viewModel.fetchCharacters()
            }
            .navigationTitle("Dragon Ball")
        }
    }
}

#Preview {
    CharactersView()
}
