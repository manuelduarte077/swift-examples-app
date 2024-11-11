//
//  Home.swift
//  SignInWithApple
//
//  Created by Manuel Duarte on 11/11/24.
//

import SwiftUI
import FirebaseAuth


struct Home: View {
    @AppStorage("log_Status") private var logStatus: Bool = false
    
    var body: some View {
        NavigationStack {
            Button("Logout") {
                try? Auth.auth().signOut()
                logStatus = false
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    Home()
}
