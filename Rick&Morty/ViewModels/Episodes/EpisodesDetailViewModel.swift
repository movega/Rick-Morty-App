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
    
    init(character: [Character]? = [], episode: Episodes? = nil, apiService: Manager = Manager()) {
        self.character = character
        self.episode = episode
        self.apiService = apiService
    }
    
    func loadMultipleCharacters(url: [String]) {
        apiService.fetchMultipleCharacters(urls: url) { character in
            DispatchQueue.main.async {
                self.character = character
            }
        }
    }
}
