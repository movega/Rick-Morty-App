//
//  CharacterDetailViewModel.swift
//  Rick&Morty
//
//  Created by Optiva Media on 29/11/23.
//

import Foundation

class CharacterDetailViewModel: ObservableObject {
    @Published var character: Character?
    @Published var location: Locations?
    @Published var episodes: [Episodes]?
    private let apiService: Manager
    
    init(character: Character? = nil, location: Locations? = nil, episodes: [Episodes]? = [], apiService: Manager = Manager()) {
        self.character = character
        self.location = location
        self.episodes = episodes
        self.apiService = apiService
    }
    
    func loadLocation(url: String) {
        apiService.fetchSingleLocation(url: url) { [weak self] location in
            DispatchQueue.main.async {
                self?.location = location
            }
        }
    }
    
    func loadMultipleEpisodes(url: [String]) {
        apiService.fetchMultipleEpisodes(urls: url) { episodes in
            DispatchQueue.main.async {
                self.episodes = episodes
            }
        }
    }
}
