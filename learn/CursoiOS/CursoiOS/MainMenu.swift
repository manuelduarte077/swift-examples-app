import SwiftUI

struct MainMenu: View {
    var body: some View {
        NavigationStack{
            List {
                NavigationLink(destination: IMCView(), label: {
                    Text("IMC APP")
                })
                
                NavigationLink(destination: SuperHeroSearchBar(), label: {
                    Text("Superhero finder")
                })


                NavigationLink(destination: ListExample(), label: {
                    Text("List")
                })

            }
        }
    }
}

#Preview {
    MainMenu()
}
