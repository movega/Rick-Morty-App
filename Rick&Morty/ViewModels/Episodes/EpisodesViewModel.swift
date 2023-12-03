//
//  EpisodesViewModel.swift
//  Rick&Morty
//
//  Created by Optiva Media on 3/12/23.
//

import Foundation

class EpisodesViewModel: ObservableObject {
    @Published var episodes: [Episodes] = []
    private var apiService = Manager()
    private var currentPage = 1
    
    func loadEpisodes() {
        apiService.fetchEpisodes(page:currentPage) { [weak self] episodes in
            DispatchQueue.main.async {
                self?.episodes += episodes
                self?.currentPage += 1
            }
        }
    }
    
}
