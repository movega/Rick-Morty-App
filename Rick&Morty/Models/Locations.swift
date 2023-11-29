//
//  Locations.swift
//  Rick&Morty
//
//  Created by Optiva Media on 28/11/23.
//

import Foundation

struct LocationsResponse: Decodable {
    var results: [Locations]
}

struct Locations: Identifiable, Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
