import Foundation
import SwiftUI


<<<<<<< Updated upstream
=======
// view modifier
>>>>>>> Stashed changes
struct CardBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.black)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.2), radius: 4)
    }
}

<<<<<<< Updated upstream
=======
// view extension for better modifier access
>>>>>>> Stashed changes
extension View {
    func cardBackground() -> some View {
        modifier(CardBackground())
    }
}

struct ContentView: View {
<<<<<<< Updated upstream

    @State private var joke: String = ""
    
    var body: some View {
                
        Text(joke)
            .foregroundColor(Color.white)
            .padding()
=======
    
    @State private var joke: String = ""
    
    var body: some View {
        
        
        Text(joke)
            .foregroundColor(Color.white)
            .padding(20)
>>>>>>> Stashed changes
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
