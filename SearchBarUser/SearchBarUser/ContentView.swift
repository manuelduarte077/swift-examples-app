//
//  ContentView.swift
//  SearchBarUser
//
//  Created by Don Manuel on 24/6/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    @State private var searchQuery = ""
 
    
    var body: some View {
        NavigationStack {
        
            List(viewModel.filteredUsers, id: \.id) { user in
                
                NavigationLink {
                    UserDetailView(user: user)
                } label: {
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
                
            }
            .searchable(text: $searchQuery, prompt: "Search user")
            .onChange(of: searchQuery, perform: { query in
                viewModel.filterUsers(query: query)
            })
            .navigationTitle("Users")
        }
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
