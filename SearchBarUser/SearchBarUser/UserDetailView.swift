//
//  UserDetailView.swift
//  SearchBarUser
//
//  Created by Don Manuel on 24/6/23.
//

import SwiftUI

struct UserDetailView: View {
    
    @State var user: Users
    
    var body: some View {
        
        VStack {
            Image(systemName: "person")
                .resizable()
                .frame(width: 50, height: 50)
            
            VStack {
                Text("User: \(user.name)")
                Text("Email: \(user.email)")
                Text("Phone: \(user.phone)")
                Text("Company: \(user.company.name)")
                Text("City: \(user.address.city)")
                
            }
        }
        
    }
}


