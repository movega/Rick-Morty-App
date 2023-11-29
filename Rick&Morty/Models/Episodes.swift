//
//  Episodes.swift
//  Rick&Morty
//
//  Created by Optiva Media on 28/11/23.
//

import Foundation

struct EpisodesResponse: Decodable {
    var results: [Episodes]
}

struct Episodes: Identifiable, Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
