//
//  ContentView.swift
//  SearchEvents
//
//  Created by Manuel Duarte on 27/9/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            SearchableMap()
                .tabItem{
                    Label("Maps", systemImage: "map")
                }
            
            LocationSearchView()
                .tabItem{
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}

#Preview {
    ContentView()
}
