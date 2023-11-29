//
//  Manager.swift
//  Rick&Morty
//
//  Created by Optiva Media on 28/11/23.
//

import Foundation

class Manager {
    
    func fetchCharacters(completion: @escaping ([Character]) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else { return }
            
            do {
                let apiResponse = try JSONDecoder().decode(CharacterResponse.self, from: data)
                completion(apiResponse.results)
            } catch {
                print("Decoding error: \(error)")
            }
        }.resume()
    }
    
    func fetchSingleCharacter(url: String, completion: @escaping (Character) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else { return }
            
            do {
                let apiResponse = try JSONDecoder().decode(Character.self, from: data)
                completion(apiResponse)
            } catch {
                print("Decoding error: \(error)")
            }
        }.resume()
    }
    
    func fetchMultipleCharacters(url: String, completion: @escaping ([Character]) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else { return }
            
            do {
                let apiResponse = try JSONDecoder().decode(CharacterResponse.self, from: data)
                completion(apiResponse.results)
            } catch {
                print("Decoding error: \(error)")
            }
        }.resume()
    }
    
    func fetchLocations(completion: @escaping ([Locations]) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/location") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else { return }
            
            do {
                let apiResponse = try JSONDecoder().decode(LocationsResponse.self, from: data)
                completion(apiResponse.results)
            } catch {
                print("Decoding error: \(error)")
            }
        }.resume()
    }
    
    func fetchSingleLocation(url: String, completion: @escaping (Locations) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else { return }
            
            do {
                let apiResponse = try JSONDecoder().decode(Locations.self, from: data)
                completion(apiResponse)
            } catch {
                print("Decoding error: \(error)")
            }
        }.resume()
    }
    
    func fetchMultipleLocation(completion: @escaping ([Locations]) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/location/3,21") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else { return }
            
            do {
                let apiResponse = try JSONDecoder().decode(LocationsResponse.self, from: data)
                completion(apiResponse.results)
            } catch {
                print("Decoding error: \(error)")
            }
        }.resume()
    }
    
    func fetchEpisodes(completion: @escaping ([Episodes]) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/episode") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else { return }
            
            do {
                let apiResponse = try JSONDecoder().decode(EpisodesResponse.self, from: data)
                completion(apiResponse.results)
            } catch {
                print("Decoding error: \(error)")
            }
        }.resume()
    }
    
    func fetchMultipleEpisodes(url: String, completion: @escaping ([Episodes]) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else { return }
            
            do {
                let apiResponse = try JSONDecoder().decode([EpisodesResponse].self, from: data)
                completion(apiResponse.first?.results ?? [])
            } catch {
                print("Decoding error: \(error)")
            }
        }.resume()
    }
}
