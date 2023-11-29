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
            CharacterListView(viewModel: CharacterListViewModel())
                .tabItem {
                    Image(systemName: "tv")
                    Text("Characters")
                }
            LocationsView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Locations")
                }
            EpisodesView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Episodes")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
        }
    }
}

#Preview {
    ContentView()
}
