//
//  CharacterColumnsView.swift
//  Rick&Morty
//
//  Created by Optiva Media on 1/12/23.
//

import SwiftUI

struct CharacterColumnsView: View {
    var characters: [Character]?
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
            ForEach(characters ?? []) { character in
                CharacterCell(character: character)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    CharacterColumnsView(characters: [])
}
