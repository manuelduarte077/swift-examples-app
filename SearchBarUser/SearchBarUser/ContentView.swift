//
//  ContentView.swift
//  SearchBarUser
//
//  Created by Don Manuel on 24/6/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var users: listOfUsers = []
    @State var searchUser = ""
    
    var filteredUsers: listOfUsers {
        guard !searchUser.isEmpty else { return users }
        return users.filter {$0.name.localizedStandardContains(searchUser)}
    }
    
    var body: some View {
        NavigationStack {
        
            List(filteredUsers, id: \.id) { user in
                
                HStack {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .padding(12)
                        .background(Color.black)
                        .clipShape(Circle())
                    
                    VStack {
                        Text(user.name)
                        Text(user.email)
                    }.font(.title3)
                }
            }
            .task {
                users = await getUsers()
            }
            .searchable(text: $searchUser, prompt: "Search user")
            .navigationTitle("Users")
        }
    }
    
     // Funcion que me devuelve una lista de usuarios
    func getUsers() async -> listOfUsers {
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return try! decoder.decode(listOfUsers.self, from: data)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
