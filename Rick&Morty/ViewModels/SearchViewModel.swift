//
//  SearchViewModel.swift
//  Rick&Morty
//
//  Created by Optiva Media on 30/11/23.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var characters: [Character]?
    @Published var locations: [Locations]?
    @Published var episodes: [Episodes]?
    private let apiService: Manager
    
    var searchFilters: [SearchFilter] = [SearchFilter(name: "Characters", isSelected: false), SearchFilter(name: "Locations", isSelected: false), SearchFilter(name: "Episodes", isSelected: false)]
    
    
    init(characters: [Character]? = [], locations: [Locations] = [], episodes: [Episodes]? = [], apiService: Manager = Manager()) {
        self.characters = characters
        self.locations = locations
        self.episodes = episodes
        self.apiService = apiService
    }
    
    func filterCharacters(filters: [SearchFilter], searchText: String) {
        apiService.fetchFilteredCharacters(filters: filters, searchText: searchText) { [weak self] characters in
            DispatchQueue.main.async {
                self?.characters = characters
            }
        }
    }
    
    func filterLocations(filters: [SearchFilter], searchText: String) {
        apiService.fetchFilteredLocations(filters: filters, searchText: searchText) { [weak self] locations in
            DispatchQueue.main.async {
                self?.locations = locations
            }
        }
    }
    
    func filterEpisodes(filters: [SearchFilter], searchText: String) {
        apiService.fetchFilteredEpisodes(filters: filters, searchText: searchText) { [weak self] episodes in
            DispatchQueue.main.async {
                self?.episodes = episodes
            }
        }
    }
}
