//
//  EpisodesDetailViewModel.swift
//  Rick&Morty
//
//  Created by Optiva Media on 29/11/23.
//

import Foundation

class EpisodesDetailViewModel: ObservableObject {
    @Published var character: [Character]?
    @Published var episode: Episodes?
    private let apiService: Manager
    private let baseURL = "https://rickandmortyapi.com/api/character/1,2,3"
    
    init(character: [Character]? = [], episode: Episodes? = nil, apiService: Manager = Manager()) {
        self.character = character
        self.episode = episode
        self.apiService = apiService
    }
    
    func loadMultipleCharacters(url: String) {
        apiService.fetchMultipleCharacters(url: baseURL) { character in
            self.character = character
        }
    }
}
