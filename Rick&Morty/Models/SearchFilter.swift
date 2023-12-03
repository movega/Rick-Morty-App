//
//  SearchFilter.swift
//  Rick&Morty
//
//  Created by Optiva Media on 30/11/23.
//

import Foundation

struct SearchFilter: Hashable {
    let name: String
    var isSelected: Bool
    
    init(name: String, isSelected: Bool) {
        self.name = name
        self.isSelected = isSelected
    }
}


