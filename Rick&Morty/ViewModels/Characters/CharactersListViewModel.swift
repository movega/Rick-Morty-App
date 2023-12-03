//
//  CharactersListViewModel.swift
//  Rick&Morty
//
//  Created by Optiva Media on 28/11/23.
//

import Foundation

class CharactersViewModel: ObservableObject {
    @Published var characters: [Character] = []
    private var apiService = Manager()
    private var currentPage = 1
    
    func loadCharacters() {
        apiService.fetchCharacters(page: currentPage) { [weak self] characters in
            DispatchQueue.main.async {
                self?.characters += characters
                self?.currentPage += 1
            }
        }
    }
}
