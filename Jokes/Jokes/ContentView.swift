import Foundation
import SwiftUI


struct CardBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.black)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.2), radius: 4)
    }
}

extension View {
    func cardBackground() -> some View {
        modifier(CardBackground())
    }
}

struct ContentView: View {

    @State private var joke: String = ""
    
    var body: some View {
                
        Text(joke)
            .foregroundColor(Color.white)
            .padding()
            .cardBackground()
           
        
        Button {
            Task {
                
                let (data, _) = try await URLSession.shared.data(from: URL(string:"https://api.chucknorris.io/jokes/random")!)
                
                let decodedResponse = try? JSONDecoder().decode(Joke.self, from: data)
                
                joke = decodedResponse?.value ?? ""
                
            }
        } label: {
            Text("Fetch Joke")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Joke: Codable {
    let value: String
}
