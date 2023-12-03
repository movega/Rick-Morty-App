//
//  LocationsViewModel.swift
//  Rick&Morty
//
//  Created by Optiva Media on 3/12/23.
//

import Foundation

class LocationsViewModel: ObservableObject {
    @Published var locations: [Locations] = []
    private var apiService = Manager()
    private var currentPage = 1
    
    func loadLocations() {
        apiService.fetchLocations(page: currentPage) { [weak self] locations in
            DispatchQueue.main.async {
                self?.locations += locations
                self?.currentPage += 1
            }
        }
    }
}
