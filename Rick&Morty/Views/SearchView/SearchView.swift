//
//  SearchView.swift
//  Rick&Morty
//
//  Created by Optiva Media on 28/11/23.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel = SearchViewModel()
    @State private var searchText = ""
    @State private var isSearching = false
    @State private var selectedFilter: SearchFilter? = nil
    @State private var hideCharacters = false
    @State private var hideEpisodes = false
    @State private var hideLocations = false
    let infoHelper = InfoHelper()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    infoHelper.sectionTitle("Search")
                    
                    SearchBar(searchText: $searchText, isSearching: $isSearching)
                    
                    FilterRow(filters: viewModel.searchFilters, selectedFilter: $selectedFilter)
                    
                    if let selectedFilter = selectedFilter {
                        switch selectedFilter.name {
                        case "Characters":
                            SubfilterRow(filters: $viewModel.characterFilters)
                        case "Locations":
                            SubfilterRow(filters: $viewModel.locationFilters)
                        case "Episodes":
                            SubfilterRow(filters: $viewModel.episodeFilters)
                        default:
                            Spacer()
                        }
                    }
                    
                    if isSearching {
                        if !hideCharacters ,!(viewModel.characters?.isEmpty ?? true) {
                            infoHelper.sectionTitle("Characters")
                            CharactersRowView(characters: viewModel.characters)
                        }
                        
                        if !hideLocations, !(viewModel.locations?.isEmpty ?? true) {
                            infoHelper.sectionTitle("Locations")
                            LocationsRowView(locations: viewModel.locations)
                        }
                        
                        if !hideEpisodes, !(viewModel.episodes?.isEmpty ?? true) {
                            infoHelper.sectionTitle("Episodes")
                            EpisodesRowView(episodes: viewModel.episodes)
                                .padding(.bottom)
                        }
                    } else {
                        Spacer()
                    }
                }
                .navigationBarTitle("Rick and Morty Universe", displayMode: .inline)
                .onReceive(NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification)) { _ in
                    performSearch()
                }
            }.background(Color.black)
        }
    }
    
    private func performSearch() {
        if let selectedFilter = selectedFilter {
            switch selectedFilter.name {
            case "Characters":
                viewModel.filterCharacters(filters: viewModel.characterFilters, searchText: searchText)
                hideCharacters = false
                hideLocations = true
                hideEpisodes = true
            case "Locations":
                viewModel.filterLocations(filters: viewModel.locationFilters, searchText: searchText)
                hideCharacters = true
                hideLocations = false
                hideEpisodes = true
            case "Episodes":
                viewModel.filterEpisodes(filters: viewModel.episodeFilters, searchText: searchText)
                hideCharacters = true
                hideLocations = true
                hideEpisodes = false
            default:
                break
            }
        } else {
            viewModel.filterCharacters(filters: viewModel.characterFilters, searchText: searchText)
            viewModel.filterLocations(filters: viewModel.locationFilters, searchText: searchText)
            viewModel.filterEpisodes(filters: viewModel.episodeFilters, searchText: searchText)
            hideCharacters = false
            hideLocations = false
            hideEpisodes = false
        }
    }
}



#Preview {
    SearchView()
}
