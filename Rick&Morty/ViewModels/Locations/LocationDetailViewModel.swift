//
//  LocationDetailViewModel.swift
//  Rick&Morty
//
//  Created by Optiva Media on 29/11/23.
//

import Foundation

class LocationDetailViewModel: ObservableObject {
    @Published var character: [Character]?
    @Published var location: Locations?
    private let apiService: Manager
    
    init(character: [Character]? = [], location: Locations? = nil, apiService: Manager = Manager()) {
        self.character = character
        self.location = location
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
