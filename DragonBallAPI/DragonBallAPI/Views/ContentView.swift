import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            CharactersView()
                .tabItem {
                    Label("Personajes", systemImage: "person")
                }
            
            PlanetsView()
                .tabItem {
                    Label("Planetas", systemImage: "globe.americas")
                }
        }
    }
}

#Preview {
    ContentView()
}
