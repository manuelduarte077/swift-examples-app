import SwiftUI

@main
struct e_CommerceApp: App {
    @StateObject var vm = ChairViewModel()
    
    var body: some Scene {
        WindowGroup {
         MainView()
            .environmentObject(vm)
        }
    }
}
