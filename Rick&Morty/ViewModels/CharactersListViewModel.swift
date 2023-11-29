//
//  CharactersListViewModel.swift
//  Rick&Morty
//
//  Created by Optiva Media on 28/11/23.
//

import Foundation

class CharacterListViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var locations: [Locations] = []
    @Published var episodes: [Episodes] = []
    private var apiService = Manager()
    
    func loadCharacters() {
        apiService.fetchCharacters { [weak self] characters in
            DispatchQueue.main.async {
                self?.characters = characters
            }
        }
    }
    
    func loadLocations() {
        apiService.fetchLocations { [weak self] locations in
            self?.locations = locations
        }
    }
    
    func loadEpisodes() {
        apiService.fetchEpisodes { [weak self] episodes in
            self?.episodes = episodes
        }
    }
}
