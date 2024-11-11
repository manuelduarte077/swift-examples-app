//
//  ViewModel.swift
//  SearchBarUser
//
//  Created by Don Manuel on 24/6/23.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var users: listOfUsers = []
    @Published var filteredUsers: listOfUsers = []
    
    init() {
        Task {
            await getUsers()
        }
    }
    
    // Funcion que me devuelve una lista de usuarios
   func getUsers() async {
       
       let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
       let (data, _) = try! await URLSession.shared.data(from: url)
       let decoder = JSONDecoder()
       
       decoder.keyDecodingStrategy = .convertFromSnakeCase
       
       DispatchQueue.main.async {
           self.users = try! decoder.decode(listOfUsers.self, from: data)
           self.filteredUsers = self.users
       }
        
   }
    
    func filterUsers(query: String){
        if query.isEmpty {
            filteredUsers =  users
        } else {
            filteredUsers =  users.filter { user in
                user.name.lowercased().contains(query.lowercased())
            }
        }
    }
    
}
