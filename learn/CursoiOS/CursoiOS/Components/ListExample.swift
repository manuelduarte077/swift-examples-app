import SwiftUI

var pokemons = [
    Pokemon(name: "Pikachu"),
    Pokemon(name: "Pikachu"),
    Pokemon(name: "Pikachu"),
    Pokemon(name: "Pikachu"),
    Pokemon(name: "Pikachu")
]

var languages = [
    Language(name: "C", founder: "Ricardo"),
    Language(name: "C++", founder: "Camilo"),
    Language(name: "Java", founder: "Francisco"),
    Language(name: "C#", founder: "Roberto"),
    Language(name: "Dart", founder: "Jorge")
]

struct ListExample: View {
    var body: some View {
        List {
            Section(header: Text("Pokemons")) {
                ForEach(pokemons) { pokemon in
                    Text(pokemon.name)
                }
            }
            
            Section(header: Text("Languages").font(.title3)) {
                ForEach(languages) { languaje in
                    HStack {
                        Text(languaje.name).font(.title2).bold()
                        Spacer()
                        Text(languaje.founder)
                    }
                }
            }
        }
    }
}

struct Language: Identifiable {
    var id = UUID()
    let name: String
    let founder: String
}


struct Pokemon: Identifiable {
    var id = UUID()
    let name: String
}

#Preview {
    ListExample()
}
