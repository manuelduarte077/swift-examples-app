//
//  LoginView.swift
//  FirebaseStoreAPI
//
//  Created by Manuel Duarte on 11/10/24.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    // Properties
    @State private var email = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    @State private var errorMessage = ""
    
    
    var body: some View {
        if isLoggedIn {
            VStack {
                ProductListView()
            }
        } else {
            VStack {
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: login) {
                    Text("Iniciar Sesión")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
                Button(action: register) {
                    Text("Registrarse")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            .padding()
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error {
                errorMessage = "Error: \(error.localizedDescription)"
            } else {
                isLoggedIn = true
            }
        }
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error {
                errorMessage = "Error: \(error.localizedDescription)"
            } else {
                isLoggedIn = true
            }
        }
    }
}

#Preview {
    LoginView()
}
