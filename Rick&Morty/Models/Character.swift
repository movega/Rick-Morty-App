//
//  Character.swift
//  Rick&Morty
//
//  Created by Optiva Media on 28/11/23.
//

import Foundation

struct CharacterResponse: Decodable {
    var results: [Character]
}

struct Character: Identifiable, Decodable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin: Origin
    var location: Location
    var image: String
    var episode: [String]
    var url: String
}

struct Origin: Decodable {
    var name: String
    var url: String
}

struct Location: Decodable {
    var name: String
    var url: String
}
