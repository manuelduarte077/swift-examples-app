//
//  FirebaseStoreAPIApp.swift
//  FirebaseStoreAPI
//
//  Created by Manuel Duarte on 11/10/24.
//

import SwiftUI
import Firebase

@main
struct FirebaseStoreAPIApp: App {
    
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
