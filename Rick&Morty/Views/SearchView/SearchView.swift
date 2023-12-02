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
    let infoHelper = InfoHelper()
    
    @State private var hideCharacters = false
    @State private var hideEpisodes = false
    @State private var hideLocations = false
    
    @State var characterFilters = [SearchFilter(name: "Name", isSelected: true), SearchFilter(name: "Status", isSelected: false), SearchFilter(name: "Species", isSelected: false), SearchFilter(name: "Type", isSelected: false), SearchFilter(name: "Gender", isSelected: false)]
    @State var locationFilters = [SearchFilter(name: "Name", isSelected: true), SearchFilter(name: "Type", isSelected: false), SearchFilter(name: "Dimension", isSelected: false)]
    @State var episodeFilters = [SearchFilter(name: "Name", isSelected: true), SearchFilter(name: "Episode", isSelected: false)]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    SearchBar(searchText: $searchText, isSearching: $isSearching)
                    
                    FilterRow(filters: viewModel.searchFilters, selectedFilter: $selectedFilter)
                    
                    if let selectedFilter = selectedFilter {
                        switch selectedFilter.name {
                        case "Characters":
                            SubfilterRow(filters: $characterFilters)
                        case "Locations":
                            SubfilterRow(filters: $locationFilters)
                        case "Episodes":
                            SubfilterRow(filters: $characterFilters)
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
                        }
                    } else {
                        Spacer()
                    }
                }
                .navigationTitle("Search")
                .onReceive(NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification)) { _ in
                    if let selectedFilter = selectedFilter {
                        switch selectedFilter.name {
                        case "Characters":
                            viewModel.filterCharacters(filters: characterFilters, searchText: searchText)
                            hideCharacters = false
                            hideLocations = true
                            hideEpisodes = true
                        case "Locations":
                            viewModel.filterLocations(filters: locationFilters, searchText: searchText)
                            hideCharacters = true
                            hideLocations = false
                            hideEpisodes = true
                        case "Episodes":
                            viewModel.filterEpisodes(filters: episodeFilters, searchText: searchText)
                            hideCharacters = true
                            hideLocations = true
                            hideEpisodes = false
                        default:
                            break
                        }
                    } else {
                        viewModel.filterCharacters(filters: characterFilters, searchText: searchText)
                        viewModel.filterLocations(filters: locationFilters, searchText: searchText)
                        viewModel.filterEpisodes(filters: episodeFilters, searchText: searchText)
                        hideCharacters = false
                        hideLocations = false
                        hideEpisodes = false
                    }
                }
            }
        }
    }
}

#Preview {
    SearchView()
}
