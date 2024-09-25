//
//  ContentView.swift
//  APICombineDemo
//
//  Created by Manuel Duarte on 23/9/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = UserListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                if viewModel.isLoading {
                    ProgressView()
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else {
                    ForEach(viewModel.users) { user in
                        NavigationLink(destination: EmptyView()) {
                            UserRowView(user: user)
                        }
                    }
                }
            }
            .navigationTitle("Users")
            .onAppear {
                viewModel.fetchUsers()
            }
        }
    }
}

#Preview {
    ContentView()
}
