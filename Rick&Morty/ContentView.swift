//
//  ContentView.swift
//  Rick&Morty
//
//  Created by Optiva Media on 28/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CharactersView(viewModel: CharactersViewModel())
                .tabItem {
                    Image(systemName: "person")
                    Text("Characters")
                }
            LocationsView()
                .tabItem {
                    Image(systemName: "location")
                    Text("Locations")
                }
            EpisodesView()
                .tabItem {
                    Image(systemName: "tv")
                    Text("Episodes")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
        }.onAppear {
            UITabBar.appearance().backgroundColor = UIColor.white
        }
    }
}

#Preview {
    ContentView()
}
