import SwiftUI

struct MainView: View {
    var body: some View {
        
        NavigationView {
            
        TabView {
            
            ListeditemView()
                .tabItem {
                  Image(systemName: "house")
                        
                }
            
            CartItemView()
                .tabItem {
                    Image(systemName: "cart")
                        .resizable()
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ChairViewModel())
    }
}
