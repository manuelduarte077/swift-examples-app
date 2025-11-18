//
//  ContentView.swift
//  SignInWithApple
//
//  Created by Manuel Duarte on 10/11/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("log_Status") private var logStatus: Bool = false
    
    
    var body: some View {
        if logStatus {
            Home()
        } else {
            Login()
        }
    }
}

#Preview {
    ContentView()
}
